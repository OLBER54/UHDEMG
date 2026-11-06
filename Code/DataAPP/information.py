"""Content of the 'Infos' menu: enter data, save it to a text file, load it back."""
import tkinter as tk
from pathlib import Path
from tkinter import ttk, filedialog, messagebox

# Keys used in the text file. The file has one "key=value" line per field,
# so it is easy to read from any other program.
KEY_CIRCUMFERENCE = "forearm_circumference_mm"
KEY_LENGTH = "forearm_length_mm"
KEY_GENDER = "gender"
KEY_SEX = "sex"
KEY_AGE = "age"
KEY_DISORDERS = "neurological_disorders"

FILE_KEYS = [KEY_CIRCUMFERENCE, KEY_LENGTH, KEY_GENDER, KEY_SEX, KEY_AGE, KEY_DISORDERS]

SEX_CHOICES = ("Male", "Female", "Other")


# ----------------------------------------------------------------------
# File handling (also used by configuration.py)
# ----------------------------------------------------------------------
def write_info_file(path, data):
    """Write the data dictionary to a text file, one key=value per line."""
    with open(path, "w", encoding="utf-8") as f:
        for key in FILE_KEYS:
            f.write(f"{key}={data.get(key, '')}\n")


def read_info_file(path):
    """Read an info file and return its content as a dictionary of strings."""
    data = {}
    with open(path, encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if "=" not in line:
                continue
            key, value = line.split("=", 1)
            data[key.strip()] = value.strip()
    if not any(key in data for key in FILE_KEYS):
        raise ValueError("This file does not look like an information file.")
    return data


def _parse_positive_number(text, label):
    """Convert text to a number > 0 (a comma is accepted as decimal separator)."""
    try:
        value = float(text.strip().replace(",", "."))
    except ValueError:
        raise ValueError(f"{label} must be a number (in mm).")
    if value <= 0:
        raise ValueError(f"{label} must be greater than 0.")
    return value


def _format_number(value):
    return str(int(value)) if value.is_integer() else str(value)


# ----------------------------------------------------------------------
# The page
# ----------------------------------------------------------------------
class InformationPage(ttk.Frame):
    def __init__(self, parent):
        super().__init__(parent, padding=20)

        # Last file saved or loaded here (the Config page uses it automatically)
        self.current_path = None
        self.on_file_changed = None

        ttk.Label(
            self, text="Information", font=("Segoe UI", 16, "bold")
        ).grid(row=0, column=0, columnspan=2, sticky="w", pady=(0, 15))

        self.circumference_var = tk.StringVar()
        self.length_var = tk.StringVar()
        self.gender_var = tk.StringVar()
        self.sex_var = tk.StringVar()
        self.age_var = tk.StringVar()

        self._add_row(1, "Forearm circumference (mm)",
                      ttk.Entry(self, textvariable=self.circumference_var, width=30))
        self._add_row(2, "Forearm length (mm)",
                      ttk.Entry(self, textvariable=self.length_var, width=30))
        self._add_row(3, "Gender",
                      ttk.Entry(self, textvariable=self.gender_var, width=30))
        self._add_row(4, "Sex",
                      ttk.Combobox(self, textvariable=self.sex_var, values=SEX_CHOICES,
                                   state="readonly", width=27))
        self._add_row(5, "Age",
                      ttk.Entry(self, textvariable=self.age_var, width=30))

        self.disorders_text = tk.Text(self, width=40, height=4, wrap="word")
        self._add_row(6, "Neurological disorders / sickness", self.disorders_text)

        buttons = ttk.Frame(self)
        buttons.grid(row=7, column=0, columnspan=2, sticky="w", pady=(15, 5))
        ttk.Button(buttons, text="Save to file…", command=self.save).pack(side="left")
        ttk.Button(buttons, text="Load from file…", command=self.load).pack(side="left", padx=10)
        ttk.Button(buttons, text="Clear form", command=self.clear).pack(side="left")

        self.file_var = tk.StringVar(value="Last saved/loaded file: none")
        ttk.Label(self, textvariable=self.file_var, wraplength=450).grid(
            row=8, column=0, columnspan=2, sticky="w", pady=(10, 0))

    def _add_row(self, row, label, widget):
        ttk.Label(self, text=label).grid(row=row, column=0, sticky="nw", padx=(0, 15), pady=4)
        widget.grid(row=row, column=1, sticky="w", pady=4)

    def on_show(self):
        pass  # nothing to refresh on this page

    # ------------------------------------------------------------------
    def _collect(self):
        """Check the form and return its data as a dictionary (raises ValueError if invalid)."""
        circumference = _parse_positive_number(self.circumference_var.get(), "Forearm circumference")
        length = _parse_positive_number(self.length_var.get(), "Forearm length")

        age_text = self.age_var.get().strip()
        if not age_text.isdigit():
            raise ValueError("Age must be a whole number.")

        # Several disorders can be typed on separate lines: they are saved on one line
        lines = self.disorders_text.get("1.0", "end").splitlines()
        disorders = "; ".join(line.strip() for line in lines if line.strip())

        return {
            KEY_CIRCUMFERENCE: _format_number(circumference),
            KEY_LENGTH: _format_number(length),
            KEY_GENDER: self.gender_var.get().strip(),
            KEY_SEX: self.sex_var.get().strip(),
            KEY_AGE: age_text,
            KEY_DISORDERS: disorders,
        }

    def _fill(self, data):
        self.circumference_var.set(data.get(KEY_CIRCUMFERENCE, ""))
        self.length_var.set(data.get(KEY_LENGTH, ""))
        self.gender_var.set(data.get(KEY_GENDER, ""))
        self.sex_var.set(data.get(KEY_SEX, ""))
        self.age_var.set(data.get(KEY_AGE, ""))
        self.disorders_text.delete("1.0", "end")
        self.disorders_text.insert("1.0", data.get(KEY_DISORDERS, ""))

    def _set_current_path(self, path):
        self.current_path = Path(path)
        self.file_var.set(f"Last saved/loaded file: {self.current_path}")
        if self.on_file_changed is not None:
            self.on_file_changed(self.current_path)

    # ------------------------------------------------------------------
    def save(self):
        try:
            data = self._collect()
        except ValueError as error:
            messagebox.showerror("Invalid data", str(error))
            return

        path = filedialog.asksaveasfilename(
            title="Save information",
            defaultextension=".txt",
            filetypes=[("Text files", "*.txt")],
        )
        if not path:
            return
        try:
            write_info_file(path, data)
        except OSError as error:
            messagebox.showerror("Could not save", str(error))
            return
        self._set_current_path(path)

    def load(self):
        path = filedialog.askopenfilename(
            title="Load information",
            filetypes=[("Text files", "*.txt"), ("All files", "*.*")],
        )
        if not path:
            return
        try:
            data = read_info_file(path)
        except (OSError, ValueError) as error:
            messagebox.showerror("Could not load", str(error))
            return
        self._fill(data)
        self._set_current_path(path)

    def clear(self):
        self._fill({})
