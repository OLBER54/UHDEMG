"""Participant information and configuration displayed side by side."""
import tkinter as tk
from tkinter import ttk

from information import InformationPage
from configuration import ConfigurationPage


class InfoSetupPage(ttk.Frame):
    def __init__(self, parent, inventory):
        super().__init__(parent)
        self.rowconfigure(0, weight=1)
        self.columnconfigure(0, weight=1)
        canvas = tk.Canvas(self, highlightthickness=0)
        canvas.grid(row=0, column=0, sticky="nsew")
        vertical = ttk.Scrollbar(self, orient="vertical", command=canvas.yview)
        vertical.grid(row=0, column=1, sticky="ns")
        horizontal = ttk.Scrollbar(self, orient="horizontal", command=canvas.xview)
        horizontal.grid(row=1, column=0, sticky="ew")
        canvas.configure(yscrollcommand=vertical.set, xscrollcommand=horizontal.set)

        panels = ttk.Frame(canvas)
        panels.columnconfigure(0, weight=1)
        panels.columnconfigure(2, weight=1)
        panels.rowconfigure(0, weight=1)
        self.info_page = InformationPage(panels)
        self.info_page.grid(row=0, column=0, sticky="nsew")
        ttk.Separator(panels, orient="vertical").grid(row=0, column=1, sticky="ns")
        self.configuration_page = ConfigurationPage(
            panels, inventory, get_info_path=lambda: self.info_page.current_path)
        self.configuration_page.grid(row=0, column=2, sticky="nsew")
        self.info_page.on_file_changed = self._sync_information

        window = canvas.create_window((0, 0), window=panels, anchor="nw")

        def resize(_event=None):
            canvas.itemconfigure(window, width=max(canvas.winfo_width(), panels.winfo_reqwidth()),
                                 height=max(canvas.winfo_height(), panels.winfo_reqheight()))
            canvas.configure(scrollregion=canvas.bbox("all"))

        canvas.bind("<Configure>", resize)
        panels.bind("<Configure>", resize)

    def _sync_information(self, path):
        # Refresh immediately after saving/loading, including edits to the same file.
        self.configuration_page.load_info(path)
        self.configuration_page._last_synced_path = path

    def on_show(self):
        self.info_page.on_show()
        self.configuration_page.on_show()
