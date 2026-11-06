"""Content of the 'Data' menu: graph, console, start/stop, picture, movement and FPGA connection.

The page is a 3 x 3 grid of cells:

    +---------------------------------------+
    |  1 - 2 - 3 : graph (time vs MVC %)    |
    +--------------+------------+-----------+
    |  4 and 7     |  5 and 8   | 6 and 9   |
    |  FPGA        |  Start/Stop|  Console  |
    |  connection  |  Picture   |           |
    |  + parameters|  Movement  |           |
    +--------------+------------+-----------+

The FPGA itself is handled by fpga.py: this page only calls it.
"""
import threading
import tkinter as tk
from datetime import datetime
from tkinter import ttk, messagebox

import numpy as np

from fpga import FpgaError, USB_TYPES
from configuration import ELECTRODES_PER_PATCH

# matplotlib draws the graph. If it is missing, the page still works without the graph.
try:
    from matplotlib.figure import Figure
    from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
    HAS_MATPLOTLIB = True
except ImportError:
    HAS_MATPLOTLIB = False

# Placeholder choices: replace them with your real ones.
MOVEMENTS = ("Hand open", "Hand close", "Wrist flexion", "Wrist extension")

# How often (ms) the page collects the data received from the FPGA
POLL_INTERVAL_MS = 50

# Names used when the parameters are written in the console
PARAMETER_LABELS = {
    "sampling_frequency_hz": "sampling frequency (Hz)",
    "usb_type": "USB type",
    "spi_cable_length_ft": "SPI cable length (ft)",
    "sample_length_s": "sample length (s)",
    "preparation_time_s": "preparation time (s)",
    "port_patches": "patches by port (A-H)",
    "port_patch_names": "patch names by port (A-H)",
}


# ----------------------------------------------------------------------
# Small helpers
# ----------------------------------------------------------------------
def _parse_number(text, label, allow_zero=False):
    """Convert text to a number (a comma is accepted as decimal separator)."""
    try:
        value = float(text.strip().replace(",", "."))
    except ValueError:
        raise ValueError(f"{label} must be a number.")
    if value < 0 or (value == 0 and not allow_zero):
        raise ValueError(f"{label} must be greater than 0." if not allow_zero
                         else f"{label} cannot be negative.")
    return value


def _format(value):
    return f"{value:g}" if isinstance(value, float) else str(value)


class Light(tk.Canvas):
    """A small round indicator light that is either on or off."""

    def __init__(self, parent, on_color, off_color, size=22):
        background = ttk.Style().lookup("TFrame", "background") or "#f0f0f0"
        super().__init__(parent, width=size, height=size,
                         highlightthickness=0, bg=background)
        self.on_color = on_color
        self.off_color = off_color
        self.oval = self.create_oval(2, 2, size - 2, size - 2, outline="#333333")
        self.set(False)

    def set(self, is_on):
        self.itemconfig(self.oval, fill=self.on_color if is_on else self.off_color)


# ----------------------------------------------------------------------
# The page
# ----------------------------------------------------------------------
class DataAcqPage(ttk.Frame):
    # Choices shown in the dropdowns. A page built on this one (like the Demo page)
    # can override them with its own lists.
    movements = MOVEMENTS
    usb_types = tuple(USB_TYPES)

    def __init__(self, parent, fpga, get_required_patches=lambda: None,
                 get_selected_patches=lambda: []):
        """fpga: the object from fpga.create_fpga(), shared by all the pages."""
        super().__init__(parent, padding=10)
        self.fpga = fpga
        self.get_required_patches = get_required_patches
        self.get_selected_patches = get_selected_patches

        self.connected = False     # what the lights show
        self.connecting = False    # a connection is in progress
        self.preparing = False     # waiting for the preparation time to end
        self.acquiring = False     # recording
        self._prep_job = None
        self.recorded_times = []   # chunks of data received during the last recording
        self.recorded_data = []
        self.axes = None           # the graph axes (None if matplotlib is missing)
        self.canvas = None

        # 3 x 3 grid with equal cells
        for index in range(3):
            self.columnconfigure(index, weight=1, uniform="column")
            self.rowconfigure(index, weight=1, uniform="row")

        # Cells 1-3: graph (one row, three columns)
        graph_frame = ttk.Frame(self)
        graph_frame.grid(row=0, column=0, columnspan=3, sticky="nsew", pady=(0, 10))
        self._build_graph(graph_frame)

        # Cells 4 and 7: FPGA connection (two rows, left column)
        fpga_box = ttk.LabelFrame(self, text="FPGA", padding=10)
        fpga_box.grid(row=1, column=0, rowspan=2, sticky="nsew", padx=(0, 5))
        self._build_fpga(fpga_box)

        # Cells 5 and 8: Start/Stop, picture, movement (two rows, middle column)
        control_frame = ttk.Frame(self)
        control_frame.grid(row=1, column=1, rowspan=2, sticky="nsew", padx=5)
        self._build_controls(control_frame)

        # Cells 6 and 9: console (two rows, right column)
        console_box = ttk.LabelFrame(self, text="Console", padding=5)
        console_box.grid(row=1, column=2, rowspan=2, sticky="nsew", padx=(5, 0))
        self._build_console(console_box)

        self.set_connected(False)
        self.log("Console ready.")
        self.log(f"FPGA: {self.fpga.description}")

    # ------------------------------------------------------------------
    # Building the cells
    # ------------------------------------------------------------------
    def _build_graph(self, parent):
        if not HAS_MATPLOTLIB:
            ttk.Label(
                parent, justify="center",
                text="The graph needs matplotlib.\nInstall it with:  pip install matplotlib",
            ).pack(expand=True)
            return

        figure = Figure(dpi=100, constrained_layout=True)
        self.axes = figure.add_subplot(111)
        self.axes.set_xlabel("Time (s)")
        self.axes.set_ylabel("MVC (%)")
        self.axes.set_xlim(0, 10)    # placeholder range
        self.axes.set_ylim(0, 100)   # placeholder range
        self.axes.grid(True)

        self.canvas = FigureCanvasTkAgg(figure, master=parent)
        widget = self.canvas.get_tk_widget()
        widget.configure(width=300, height=100)  # small request: the grid stretches it
        widget.pack(fill="both", expand=True)

    def _build_fpga(self, parent):
        # Top: Connect, Disconnect, then the red and green lights
        top = ttk.Frame(parent)
        top.pack(fill="x")
        self.connect_btn = ttk.Button(top, text="Connect", command=self.connect)
        self.connect_btn.pack(side="left")
        self.disconnect_btn = ttk.Button(top, text="Disconnect", command=self.disconnect)
        self.disconnect_btn.pack(side="left", padx=(5, 15))
        self.red_light = Light(top, on_color="#ff3b30", off_color="#5a1e1b")
        self.red_light.pack(side="left", padx=(0, 5))
        self.green_light = Light(top, on_color="#2ecc40", off_color="#1b4d2b")
        self.green_light.pack(side="left")

        # Below: parameters to enter before connecting
        tabs = ttk.Notebook(parent)
        tabs.pack(fill="both", expand=True, pady=(10, 0))
        params = ttk.Frame(tabs, padding=5)
        tabs.add(params, text="Parameters")
        params.columnconfigure(1, weight=1)
        self.parameter_widgets = []

        self.sampling_freq_var = tk.StringVar()
        self.usb_type_var = tk.StringVar()
        self.spi_length_var = tk.StringVar()
        self.sample_length_var = tk.StringVar()
        self.prep_time_var = tk.StringVar()

        rates = [f"{rate:g}" for rate in self.fpga.sample_rates_hz]
        self._add_param_row(params, 0, "Sampling frequency (Hz)",
                            ttk.Combobox(params, textvariable=self.sampling_freq_var,
                                         values=rates, state="readonly", width=12))
        self._add_param_row(params, 1, "USB type",
                            ttk.Combobox(params, textvariable=self.usb_type_var,
                                         values=self.usb_types, state="readonly", width=12))
        self._add_param_row(params, 2, "SPI cable length (ft)",
                            ttk.Entry(params, textvariable=self.spi_length_var, width=15))
        self._add_param_row(params, 3, "Sample length (s)",
                            ttk.Entry(params, textvariable=self.sample_length_var, width=15))
        self._add_param_row(params, 4, "Preparation time (s)",
                            ttk.Entry(params, textvariable=self.prep_time_var, width=15))

        port_tab = ttk.Frame(tabs)
        tabs.add(port_tab, text="Ports A–H")
        self.port_total_var = tk.StringVar()
        ttk.Label(port_tab, textvariable=self.port_total_var).pack(anchor="w", padx=5, pady=5)
        viewport = tk.Canvas(port_tab, highlightthickness=0, width=200, height=180)
        scrollbar = ttk.Scrollbar(port_tab, orient="vertical", command=viewport.yview)
        viewport.configure(yscrollcommand=scrollbar.set)
        scrollbar.pack(side="right", fill="y")
        viewport.pack(side="left", fill="both", expand=True)
        ports = ttk.Frame(viewport, padding=5)
        window = viewport.create_window((0, 0), window=ports, anchor="nw")
        ports.bind("<Configure>", lambda event: viewport.configure(scrollregion=viewport.bbox("all")))
        viewport.bind("<Configure>", lambda event: viewport.itemconfigure(window, width=event.width))
        self.port_patch_vars = []
        self.port_count_boxes = []
        self.port_electrode_vars = []
        self.port_name_vars = []
        self.port_name_boxes = []
        for index, port in enumerate("ABCDEFGH"):
            box = ttk.LabelFrame(ports, text=f"Port {port}", padding=4)
            box.pack(fill="x", pady=(0, 5))
            count = tk.StringVar(value="0")
            electrodes = tk.StringVar(value="0")
            self.port_patch_vars.append(count)
            self.port_electrode_vars.append(electrodes)
            ttk.Label(box, text="Patches").grid(row=0, column=0, sticky="w")
            count_box = ttk.Combobox(box, textvariable=count, values=(0, 1, 2),
                                     state="readonly", width=3)
            count_box.grid(row=0, column=1, sticky="w")
            self.port_count_boxes.append(count_box)
            ttk.Label(box, textvariable=electrodes).grid(row=0, column=2, padx=3)
            slot_vars, slot_boxes = [], []
            for slot in range(2):
                name = tk.StringVar()
                ttk.Label(box, text=f"Patch {slot + 1}").grid(row=slot + 1, column=0, sticky="w")
                choice = ttk.Combobox(box, textvariable=name, state="disabled", width=12)
                choice.grid(row=slot + 1, column=1, columnspan=2, sticky="ew")
                slot_vars.append(name)
                slot_boxes.append(choice)
            self.port_name_vars.append(slot_vars)
            self.port_name_boxes.append(slot_boxes)
            count.trace_add("write", self._update_port_totals)
        self._update_port_totals()

    def _update_port_totals(self, *_args):
        counts = [int(var.get()) for var in self.port_patch_vars]
        for count, label in zip(counts, self.port_electrode_vars):
            label.set(f"{count * ELECTRODES_PER_PATCH} electrodes")
        selected = self.get_selected_patches()
        for count, variables, boxes in zip(counts, self.port_name_vars, self.port_name_boxes):
            for slot, (var, box) in enumerate(zip(variables, boxes)):
                box.configure(values=selected)
                if slot >= count:
                    var.set("")
        required = self.get_required_patches()
        expected = "not loaded" if required is None else str(required * ELECTRODES_PER_PATCH)
        self.port_total_var.set(
            f"Total: {sum(counts) * ELECTRODES_PER_PATCH} electrodes\nConfig: {expected}")
        self._update_port_editability()

    def _update_port_editability(self):
        locked = self.fpga.connected or self.connected or self.connecting
        for widget, editable_state in self.parameter_widgets:
            widget.configure(state="disabled" if locked else editable_state)
        for count_box, count_var, name_boxes in zip(
                self.port_count_boxes, self.port_patch_vars, self.port_name_boxes):
            count_box.configure(state="disabled" if locked else "readonly")
            for slot, name_box in enumerate(name_boxes):
                name_box.configure(state="readonly" if not locked and slot < int(count_var.get())
                                   else "disabled")

    def _add_param_row(self, parent, row, label, widget):
        self.parameter_widgets.append((widget, str(widget.cget("state"))))
        ttk.Label(parent, text=label).grid(row=row, column=0, sticky="w", padx=(0, 10), pady=4)
        widget.grid(row=row, column=1, sticky="ew", pady=4)

    def _build_controls(self, parent):
        parent.columnconfigure(0, weight=1)
        parent.columnconfigure(1, weight=1)
        # Heights: 10% buttons, 80% picture, 10% movement list
        parent.rowconfigure(0, weight=1, uniform="controls")
        parent.rowconfigure(1, weight=8, uniform="controls")
        parent.rowconfigure(2, weight=1, uniform="controls")

        # Top: Start and Stop side by side
        self.start_btn = ttk.Button(parent, text="Start", command=self.start)
        self.start_btn.grid(row=0, column=0, sticky="nsew", padx=(0, 3))
        self.stop_btn = ttk.Button(parent, text="Stop", command=self.stop)
        self.stop_btn.grid(row=0, column=1, sticky="nsew", padx=(3, 0))

        # Middle: region where the pictures will be shown
        self.picture_label = tk.Label(parent, text="Picture area", relief="sunken", bg="#e9ecef")
        self.picture_label.grid(row=1, column=0, columnspan=2, sticky="nsew", pady=5)

        # Bottom: list of movements to do
        movement_row = ttk.Frame(parent)
        movement_row.grid(row=2, column=0, columnspan=2, sticky="ew")
        ttk.Label(movement_row, text="Movement").pack(side="left", padx=(0, 10))
        self.movement_var = tk.StringVar(value=self.movements[0])
        ttk.Combobox(movement_row, textvariable=self.movement_var,
                     values=self.movements, state="readonly").pack(side="left", fill="x", expand=True)

    def _build_console(self, parent):
        self.console = tk.Text(
            parent, wrap="word", state="disabled",
            bg="#1e1e1e", fg="#d4d4d4", font="TkFixedFont", width=10, height=5,
        )
        scrollbar = ttk.Scrollbar(parent, orient="vertical", command=self.console.yview)
        self.console.configure(yscrollcommand=scrollbar.set)
        self.console.pack(side="left", fill="both", expand=True)
        scrollbar.pack(side="right", fill="y")

    def on_show(self):
        """Called each time the page is displayed. The FPGA is shared with the other pages,
        so follow its state (it may have been connected from the Demo page, for example)."""
        if self.fpga.connected and self.fpga.params:
            self._show_parameters(self.fpga.params)
        self.set_connected(self.fpga.connected)
        self._update_port_totals()

    # ------------------------------------------------------------------
    # Console
    # ------------------------------------------------------------------
    def log(self, message):
        """Write a timestamped line in the console (call this from anywhere in the program)."""
        timestamp = datetime.now().strftime("%H:%M:%S")
        self.console.configure(state="normal")
        self.console.insert("end", f"[{timestamp}] {message}\n")
        self.console.configure(state="disabled")
        self.console.see("end")

    # ------------------------------------------------------------------
    # Parameters
    # ------------------------------------------------------------------
    @property
    def parameters(self):
        """Parameters used for the current connection (kept by the shared FPGA object)."""
        return self.fpga.params

    def _collect_parameters(self):
        """Check the parameters and return them (raises ValueError if one is invalid)."""
        rate_text = self.sampling_freq_var.get()
        if not rate_text:
            raise ValueError("Please choose a sampling frequency.")
        usb_type = self.usb_type_var.get()
        if not usb_type:
            raise ValueError("Please choose a USB type.")
        port_patches = [int(var.get()) for var in self.port_patch_vars]
        required = self.get_required_patches()
        if required is None:
            raise ValueError("Load participant information in Info before connecting.")
        total = sum(port_patches) * ELECTRODES_PER_PATCH
        expected = required * ELECTRODES_PER_PATCH
        if total == 0:
            raise ValueError("Select at least one patch before connecting.")
        if total != expected:
            raise ValueError(f"Ports specify {total} electrodes, but Config requires {expected}. "
                             "Adjust the port patch counts before connecting.")
        selected = self.get_selected_patches()
        if len(selected) != required:
            raise ValueError(f"Select exactly {required} patches in Info's Configuration section before connecting.")
        port_names = [[var.get() for var in variables[:count]]
                      for count, variables in zip(port_patches, self.port_name_vars)]
        assigned = [name for names in port_names for name in names]
        if any(not name for name in assigned):
            raise ValueError("Choose a patch name for every active port slot.")
        if len(set(assigned)) != len(assigned):
            raise ValueError("Each patch can only be assigned to one port slot.")
        if set(assigned) != set(selected):
            raise ValueError("Port assignments must match the patches selected in Info's Configuration section.")
        return {
            "port_patches": port_patches,
            "port_patch_names": port_names,
            "sampling_frequency_hz": float(rate_text),
            "usb_type": usb_type,
            "spi_cable_length_ft": _parse_number(self.spi_length_var.get(), "SPI cable length"),
            "sample_length_s": _parse_number(self.sample_length_var.get(), "Sample length"),
            "preparation_time_s": _parse_number(self.prep_time_var.get(), "Preparation time",
                                                allow_zero=True),
        }

    def _show_parameters(self, params):
        for var, count in zip(self.port_patch_vars, params["port_patches"]):
            var.set(str(count))
        for variables, names in zip(self.port_name_vars, params["port_patch_names"]):
            for slot, var in enumerate(variables):
                var.set(names[slot] if slot < len(names) else "")
        self.sampling_freq_var.set(_format(params["sampling_frequency_hz"]))
        self.usb_type_var.set(params["usb_type"])
        self.spi_length_var.set(_format(params["spi_cable_length_ft"]))
        self.sample_length_var.set(_format(params["sample_length_s"]))
        self.prep_time_var.set(_format(params["preparation_time_s"]))

    # ------------------------------------------------------------------
    # Lights and buttons
    # ------------------------------------------------------------------
    def set_connected(self, connected):
        """Green on / red off when connected, the opposite otherwise."""
        self.connected = connected
        self.green_light.set(connected)
        self.red_light.set(not connected)
        self._update_buttons()

    def _update_buttons(self):
        self._update_port_editability()
        running = self.preparing or self.acquiring or self.fpga.is_acquiring()
        states = (
            (self.connect_btn, not self.connected and not self.connecting),
            (self.disconnect_btn, self.connected and not running),
            (self.start_btn, self.connected and not running),
            (self.stop_btn, running),
        )
        for button, enabled in states:
            button.configure(state="normal" if enabled else "disabled")

    # ------------------------------------------------------------------
    # FPGA connection
    # ------------------------------------------------------------------
    def _run_in_background(self, work, done):
        """Run work() in a thread so the window does not freeze, then call done(result, error)."""
        outcome = {}

        def target():
            try:
                outcome["result"] = work()
            except Exception as error:  # reported to the user by done()
                outcome["error"] = error

        thread = threading.Thread(target=target, daemon=True)
        thread.start()

        def check():
            if thread.is_alive():
                self.after(100, check)
            else:
                done(outcome.get("result"), outcome.get("error"))

        check()

    def connect(self):
        try:
            params = self._collect_parameters()
        except ValueError as error:
            messagebox.showerror("Invalid parameters", str(error))
            return
        self.connecting = True
        self._update_buttons()
        self.log("Connecting with: " + ", ".join(
            f"{PARAMETER_LABELS[key]} = {_format(value)}" for key, value in params.items()))
        self._run_in_background(lambda: self.fpga.connect(params), self._on_connect_done)

    def _on_connect_done(self, info, error):
        self.connecting = False
        if error is not None:
            self.log(f"Connection failed: {error}")
            messagebox.showerror("Connection failed", str(error))
            self.set_connected(False)
            return
        self.set_connected(True)
        self.log(f"FPGA connected: {info}")
        for port, names in zip("ABCDEFGH", self.fpga.params["port_patch_names"]):
            if names:
                self.log(f"Port {port}: {', '.join(names)} ({len(names) * ELECTRODES_PER_PATCH} electrodes)")

    def disconnect(self):
        try:
            self.fpga.disconnect()
        except FpgaError as error:
            self.log(f"Disconnection problem: {error}")
        self.set_connected(False)
        self.log("FPGA disconnected.")

    # ------------------------------------------------------------------
    # Start / Stop
    # ------------------------------------------------------------------
    def start(self):
        if not self.connected:
            messagebox.showinfo("Not connected", "Connect to the FPGA first.")
            return
        delay = self.parameters["preparation_time_s"]
        self.log(f"Start pressed (movement: {self.movement_var.get()}). "
                 f"Recording starts in {_format(delay)} s.")
        self.preparing = True
        self._update_buttons()
        self._prep_job = self.after(int(delay * 1000), self._begin_acquisition)

    def _begin_acquisition(self):
        self._prep_job = None
        self.preparing = False
        duration = self.parameters["sample_length_s"]
        try:
            self.fpga.start(duration)
        except FpgaError as error:
            self.log(f"Could not start: {error}")
            messagebox.showerror("Could not start", str(error))
            self._update_buttons()
            return
        self.recorded_times = []
        self.recorded_data = []
        self.acquiring = True
        self._update_buttons()
        self.log(f"Recording started ({_format(duration)} s at "
                 f"{_format(self.fpga.sample_rate_hz)} Hz).")
        self._poll()

    def _poll(self):
        """Collect the data received so far; repeats until the recording is over."""
        # Ask first, read after: if the recording is over, all its data is ready to be read.
        still_running = self.fpga.is_acquiring()
        times, data = self.fpga.read_available()
        if len(times) > 0:
            self.recorded_times.append(times)
            self.recorded_data.append(data)
            self.on_new_data(times, data)
        if still_running:
            self.after(POLL_INTERVAL_MS, self._poll)
        else:
            self._finish_acquisition()

    def _finish_acquisition(self):
        self.acquiring = False
        times, _ = self.get_recording()
        length = times[-1] if len(times) > 0 else 0.0
        self.log(f"Recording finished: {len(times)} samples ({length:.2f} s).")
        error = self.fpga.take_error()
        if error:
            self.log(f"Recording error: {error}")
            messagebox.showerror("Recording error", error)
        self._update_buttons()

    def stop(self):
        if self.preparing:
            self.after_cancel(self._prep_job)
            self._prep_job = None
            self.preparing = False
            self.log("Stopped before the recording began.")
            self._update_buttons()
        elif self.acquiring or self.fpga.is_acquiring():
            self.fpga.request_stop()
            self.log("Stop requested.")

    # ------------------------------------------------------------------
    # Data
    # ------------------------------------------------------------------
    def on_new_data(self, times, data):
        """Called for each chunk of data received (times in s, data in microvolts, one
        column per channel). TODO: convert to MVC % and update the graph (self.axes, self.canvas)."""

    def get_recording(self):
        """Everything received during the last recording, as (times, data)."""
        if not self.recorded_times:
            return np.empty(0), np.empty((0, 0))
        return np.concatenate(self.recorded_times), np.concatenate(self.recorded_data)
