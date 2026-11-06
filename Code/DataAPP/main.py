"""Main file: builds the window, the top menu bar, and shows the page of the selected menu."""
import tkinter as tk
from tkinter import ttk

from info_setup import InfoSetupPage
from demo import DemoPage
from dataAcq import DataAcqPage
from logs import LogsPage, PatchInventory
from fpga import create_fpga
from instructions import InstructionsPage

MENU_COLOR_NOT_SEL = "#102e4a" # Dark blue
MENU_COLOR_SEL = "#8796a4" # Lighter tint of the dark blue used

class App(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("UHDEMG")
        self.geometry("1280x700")
        self.minsize(700, 450)
        self.iconbitmap("AppLogo.ico")

        # Top bar holding the menus
        self.menubar = tk.Frame(self, bg=MENU_COLOR_NOT_SEL)
        self.menubar.pack(side="top", fill="x")

        # Content area below the bar: the page of the selected menu is shown here
        self.content = ttk.Frame(self)
        self.content.pack(side="top", fill="both", expand=True)

        # Shared data: the patch inventory is used by both Config and Logs
        self.inventory = PatchInventory()
        self.fpga = create_fpga()

        # One page per menu, each one written in its own file
        self.info_setup_page = InfoSetupPage(self.content, self.inventory)
        self.info_page = self.info_setup_page.info_page
        self.configuration_page = self.info_setup_page.configuration_page
        get_required_patches = lambda: self.configuration_page.required_patches
        get_selected_patches = self.configuration_page.selected_names
        self.demo_page = DemoPage(self.content, self.fpga, get_required_patches, get_selected_patches)
        self.data_page = DataAcqPage(self.content, self.fpga, get_required_patches, get_selected_patches)
        self.logs_page = LogsPage(self.content, self.inventory)
        self.instructions_page = InstructionsPage(self.content)

        self.menu_buttons = []
        self.current_page = None

        self.protocol("WM_DELETE_WINDOW", self.on_close)

        # Each menu is created on its own line: change the first argument to
        # rename it, or the second one to show a different page.
        self.menu1 = self.add_menu("Info", self.info_setup_page)
        self.menu3 = self.add_menu("Demo", self.demo_page)
        self.menu4 = self.add_menu("Data", self.data_page)
        self.menu5 = self.add_menu("Logs", self.logs_page)
        self.menu6 = self.add_menu("Instructions", self.instructions_page)

        # Open the first menu at startup
        self.select(self.menu1, self.info_setup_page)

    def on_close(self):
        """Release the board before the window closes."""
        try:
            self.fpga.disconnect()
        finally:
            self.destroy()

    def add_menu(self, text, page):
        """Create one button in the top bar and return it."""
        btn = tk.Button(
            self.menubar,
            text=text,
            font=("Segoe UI", 14),
            bg=MENU_COLOR_NOT_SEL,
            fg="white",
            activebackground=MENU_COLOR_SEL,
            activeforeground="white",
            relief="flat",
            padx=25,
            pady=10,
        )
        btn.config(command=lambda: self.select(btn, page))
        btn.pack(side="left")
        self.menu_buttons.append(btn)
        return btn

    def select(self, selected_btn, page):
        """Highlight the clicked button and show its page."""
        for btn in self.menu_buttons:
            btn.config(bg=MENU_COLOR_SEL if btn is selected_btn else MENU_COLOR_NOT_SEL)
        if self.current_page is not None:
            self.current_page.pack_forget()
        self.current_page = page
        page.pack(fill="both", expand=True)
        page.on_show()  # lets the page refresh itself each time it is displayed


if __name__ == "__main__":
    App().mainloop()
