"""Content of the 'Config' menu: patch/electrode calculation and patch usage tracking."""
import tkinter as tk
from pathlib import Path
from tkinter import ttk, filedialog, messagebox

from information import read_info_file, KEY_CIRCUMFERENCE, KEY_LENGTH

ELECTRODES_PER_PATCH = 32


# ----------------------------------------------------------------------
# Calculations
# ----------------------------------------------------------------------
def patches_needed(circumference_mm):
    """(((circumference / 5) + 1) / 4), decimals removed."""
    return int(((circumference_mm / 5) + 1) / 4)


def electrodes_needed(patch_count):
    return patch_count * ELECTRODES_PER_PATCH


def patch0_position(length_mm):
    """Position of patch #0: forearm length / 3 (in mm)."""
    return length_mm / 3


# ----------------------------------------------------------------------
# The page
# ----------------------------------------------------------------------
class ConfigurationPage(ttk.Frame):
    def __init__(self, parent, inventory, get_info_path):
        """
        inventory     -- the PatchInventory shared with the Logs page
        get_info_path -- function returning the info file currently used on the Infos page
        """
        super().__init__(parent, padding=20)
        self.inventory = inventory
        self.get_info_path = get_info_path

        self.required_patches = None   # known once an info file is loaded
        self._last_synced_path = None  # last Infos file that was loaded automatically
        self._listed_names = []        # patch names, in the same order as the listbox rows
        self._last_counted_selection = frozenset()

        ttk.Label(
            self, text="Configuration", font=("Segoe UI", 16, "bold")
        ).pack(anchor="w", pady=(0, 15))

        # --- 1. Info file ---------------------------------------------
        file_box = ttk.LabelFrame(self, text="1. Information file", padding=10)
        file_box.pack(fill="x")
        self.file_var = tk.StringVar(value="No file loaded")
        ttk.Label(file_box, textvariable=self.file_var).pack(side="left")
        ttk.Button(file_box, text="Load info file…",
                   command=self.browse_info_file).pack(side="right")

        # --- 2. Calculated setup --------------------------------------
        calc_box = ttk.LabelFrame(self, text="2. Calculated setup", padding=10)
        calc_box.pack(fill="x", pady=10)
        self.circumference_var = self._add_result_row(calc_box, 0, "Forearm circumference")
        self.length_var = self._add_result_row(calc_box, 1, "Forearm length")
        self.patches_var = self._add_result_row(calc_box, 2, "Patches required")
        self.electrodes_var = self._add_result_row(calc_box, 3, "Electrodes required")
        self.patch0_var = self._add_result_row(calc_box, 4, "Patch #0 position")

        # --- 3. Patches used ------------------------------------------
        patch_box = ttk.LabelFrame(self, text="3. Patches used in this setup", padding=10)
        patch_box.pack(fill="both", expand=True)
        ttk.Label(patch_box, text="Click the patches you are using (you can select several):").pack(anchor="w")

        list_frame = ttk.Frame(patch_box)
        list_frame.pack(fill="both", expand=True, pady=5)
        self.listbox = tk.Listbox(list_frame, selectmode="multiple",
                                  exportselection=False, height=8)
        scrollbar = ttk.Scrollbar(list_frame, orient="vertical", command=self.listbox.yview)
        self.listbox.configure(yscrollcommand=scrollbar.set)
        self.listbox.pack(side="left", fill="both", expand=True)
        scrollbar.pack(side="right", fill="y")
        self.listbox.bind("<<ListboxSelect>>", self.update_selection_info)

        self.selection_var = tk.StringVar()
        ttk.Label(patch_box, textvariable=self.selection_var).pack(anchor="w")
        self.increment_button = ttk.Button(patch_box, text="Increment usage of selected patches",
                                           command=self.increment_selected)
        self.increment_button.pack(anchor="w", pady=(8, 0))
        self.status_var = tk.StringVar()
        ttk.Label(patch_box, textvariable=self.status_var, wraplength=600).pack(anchor="w", pady=(5, 0))

        self.update_selection_info()

    def _add_result_row(self, box, row, label):
        """Add a 'label: value' row and return the StringVar holding the value."""
        var = tk.StringVar(value="–")
        ttk.Label(box, text=label).grid(row=row, column=0, sticky="w", padx=(0, 20), pady=2)
        ttk.Label(box, textvariable=var, font=("Segoe UI", 10, "bold")).grid(row=row, column=1, sticky="w")
        return var

    # ------------------------------------------------------------------
    def on_show(self):
        """Called every time the Config menu is opened."""
        # If a different file was saved/loaded on the Infos page, use it here too
        path = self.get_info_path()
        if path is not None and path != self._last_synced_path:
            self._last_synced_path = path
            self.load_info(path)
        # Patches may have been added in the Logs menu
        self.refresh_patches()

    # ------------------------------------------------------------------
    # Info file
    # ------------------------------------------------------------------
    def browse_info_file(self):
        path = filedialog.askopenfilename(
            title="Load information file",
            filetypes=[("Text files", "*.txt"), ("All files", "*.*")],
        )
        if path:
            self.load_info(Path(path))

    def load_info(self, path):
        """Read the info file, compute the setup and display it."""
        try:
            data = read_info_file(path)
            circumference = float(data[KEY_CIRCUMFERENCE])
            length = float(data[KEY_LENGTH])
        except (OSError, ValueError, KeyError):
            messagebox.showerror(
                "Could not load",
                f"Could not read the forearm circumference and length from:\n{path}",
            )
            return

        patch_count = patches_needed(circumference)
        self.required_patches = patch_count

        self.file_var.set(Path(path).name)
        self.circumference_var.set(f"{circumference:g} mm")
        self.length_var.set(f"{length:g} mm")
        self.patches_var.set(str(patch_count))
        self.electrodes_var.set(str(electrodes_needed(patch_count)))
        self.patch0_var.set(f"{patch0_position(length):.1f} mm")
        self.update_selection_info()

    # ------------------------------------------------------------------
    # Patch selection
    # ------------------------------------------------------------------
    def selected_names(self):
        return [self._listed_names[i] for i in self.listbox.curselection()
                if self._listed_names[i] in self.inventory.uses]

    def refresh_patches(self):
        """Reload the list from the inventory, keeping the current selection."""
        keep = set(self.selected_names())
        self._listed_names = self.inventory.names()

        self.listbox.delete(0, "end")
        for index, name in enumerate(self._listed_names):
            uses = self.inventory.uses_of(name)
            self.listbox.insert("end", f"{name}   ({uses} use{'' if uses == 1 else 's'})")
            if name in keep:
                self.listbox.selection_set(index)

        if not self._listed_names:
            self.status_var.set("No patches yet: add some in the Logs menu.")
        self.update_selection_info()

    def update_selection_info(self, _event=None):
        selected = frozenset(self.selected_names())
        self.increment_button.configure(
            state="normal" if selected and selected != self._last_counted_selection else "disabled")
        count = len(self.listbox.curselection())
        if self.required_patches is None:
            self.selection_var.set(f"{count} selected")
        else:
            self.selection_var.set(f"{count} selected / {self.required_patches} required")

    def increment_selected(self):
        names = self.selected_names()
        if not names:
            messagebox.showinfo("Nothing selected", "Select the patches used in this setup first.")
            return

        if self.required_patches is not None and len(names) != self.required_patches:
            proceed = messagebox.askyesno(
                "Different number of patches",
                f"This setup requires {self.required_patches} patches but you selected "
                f"{len(names)}.\n\nIncrement their usage anyway?",
            )
            if not proceed:
                return

        try:
            self.inventory.increment(names)
        except OSError as error:
            messagebox.showerror("Could not save the inventory", str(error))
            return

        # Keep the setup available to Data/Demo, while preventing a duplicate click.
        self._last_counted_selection = frozenset(names)
        self.refresh_patches()
        self.status_var.set("Usage incremented for: " + ", ".join(names))
