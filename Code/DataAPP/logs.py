"""Content of the 'Logs' menu: patch inventory with usage counts, saved in a CSV file."""
import csv
import os
import tkinter as tk
from pathlib import Path
from tkinter import ttk, messagebox

# The inventory file is stored next to the program files
INVENTORY_FILE = Path(__file__).with_name("patch_inventory.csv")


# ----------------------------------------------------------------------
# Data: shared by the Logs page (display / add) and the Config page (increment)
# ----------------------------------------------------------------------
class PatchInventory:
    def __init__(self, path=INVENTORY_FILE):
        self.path = Path(path)
        self.uses = {}  # patch name -> number of times used (keeps insertion order)
        self.load()

    def load(self):
        self.uses = {}
        if not self.path.exists():
            return
        with open(self.path, newline="", encoding="utf-8") as f:
            for row in csv.DictReader(f):
                name = (row.get("name") or "").strip()
                if not name:
                    continue
                try:
                    self.uses[name] = int(row.get("uses") or 0)
                except ValueError:
                    self.uses[name] = 0

    def save(self):
        """Write to a temporary file first so a crash cannot corrupt the inventory."""
        temp_path = self.path.with_suffix(".tmp")
        with open(temp_path, "w", newline="", encoding="utf-8") as f:
            writer = csv.writer(f)
            writer.writerow(["name", "uses"])
            for name, uses in self.uses.items():
                writer.writerow([name, uses])
        os.replace(temp_path, self.path)

    def names(self):
        return list(self.uses)

    def uses_of(self, name):
        return self.uses[name]

    def add_patch(self, name):
        name = name.strip()
        if not name:
            raise ValueError("The patch name cannot be empty.")
        if name.lower() in (existing.lower() for existing in self.uses):
            raise ValueError(f"A patch named '{name}' already exists.")
        self.uses[name] = 0
        try:
            self.save()
        except OSError:
            del self.uses[name]
            raise

    def remove_patches(self, names):
        """Remove selected patches and restore the inventory if saving fails."""
        previous = self.uses.copy()
        selected = set(names)
        self.uses = {name: uses for name, uses in self.uses.items()
                     if name not in selected}
        try:
            self.save()
        except OSError:
            self.uses = previous
            raise

    def increment(self, names):
        """Add 1 to the usage count of each given patch and save."""
        for name in names:
            if name not in self.uses:
                raise KeyError(name)
        for name in names:
            self.uses[name] += 1
        try:
            self.save()
        except OSError:
            for name in names:
                self.uses[name] -= 1
            raise


# ----------------------------------------------------------------------
# The page
# ----------------------------------------------------------------------
class LogsPage(ttk.Frame):
    def __init__(self, parent, inventory):
        super().__init__(parent, padding=20)
        self.inventory = inventory

        ttk.Label(
            self, text="Patch inventory", font=("Segoe UI", 16, "bold")
        ).pack(anchor="w", pady=(0, 15))

        # Add a new patch
        add_box = ttk.LabelFrame(self, text="Add a new patch", padding=10)
        add_box.pack(fill="x")
        self.name_var = tk.StringVar()
        name_entry = ttk.Entry(add_box, textvariable=self.name_var)
        name_entry.pack(side="left", fill="x", expand=True, padx=(0, 10))
        name_entry.bind("<Return>", lambda _event: self.add_patch())
        ttk.Button(add_box, text="Add patch", command=self.add_patch).pack(side="left")
        ttk.Button(add_box, text="Remove patch", command=self.remove_selected).pack(
            side="left", padx=(10, 0))

        self.status_var = tk.StringVar()
        ttk.Label(self, textvariable=self.status_var).pack(anchor="w", pady=5)

        # Table of patches and their usage
        table_frame = ttk.Frame(self)
        table_frame.pack(fill="both", expand=True)
        self.table = ttk.Treeview(table_frame, columns=("name", "uses"), show="headings",
                                  selectmode="extended")
        self.table.heading("name", text="Patch")
        self.table.heading("uses", text="Times used")
        self.table.column("name", anchor="w", width=250)
        self.table.column("uses", anchor="center", width=100)
        scrollbar = ttk.Scrollbar(table_frame, orient="vertical", command=self.table.yview)
        self.table.configure(yscrollcommand=scrollbar.set)
        self.table.pack(side="left", fill="both", expand=True)
        scrollbar.pack(side="right", fill="y")

        self.refresh()

    def on_show(self):
        self.refresh()  # counts may have been incremented from the Config menu

    def refresh(self):
        self.table.delete(*self.table.get_children())
        for name in self.inventory.names():
            self.table.insert("", "end", values=(name, self.inventory.uses_of(name)))

    def add_patch(self):
        name = self.name_var.get().strip()
        try:
            self.inventory.add_patch(name)
        except ValueError as error:
            messagebox.showerror("Cannot add patch", str(error))
            return
        except OSError as error:
            messagebox.showerror("Could not save the inventory", str(error))
            return
        self.name_var.set("")
        self.status_var.set(f"Added patch '{name}'.")
        self.refresh()

    def remove_selected(self):
        selected = self.table.selection()
        if not selected:
            messagebox.showinfo("Nothing selected", "Select the patches to remove first.")
            return
        names = [self.table.item(item, "values")[0] for item in selected]
        try:
            self.inventory.remove_patches(names)
        except OSError as error:
            messagebox.showerror("Could not save the inventory", str(error))
            return
        self.refresh()
        self.status_var.set("Removed patches: " + ", ".join(names))
