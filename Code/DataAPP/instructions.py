"""Read-only instructions loaded from instructions.txt beside this module."""
from pathlib import Path
import re
import tkinter as tk
from tkinter import ttk


INSTRUCTIONS_FILE = Path(__file__).with_name("instructions.txt")
FORMATTING = re.compile(r"\*\*(.+?)\*\*|<u>(.+?)</u>", re.DOTALL)


def formatted_segments(contents, tags=()):
    """Recognize paired bold/underline markers; keep other text literal."""
    position = 0
    for match in FORMATTING.finditer(contents):
        yield contents[position:match.start()], tags
        bold = match.group(1) is not None
        inner = match.group(1) if bold else match.group(2)
        yield from formatted_segments(inner, tags + (("bold" if bold else "underline"),))
        position = match.end()
    yield contents[position:], tags


class InstructionsPage(ttk.Frame):
    def __init__(self, parent):
        super().__init__(parent, padding=20)
        ttk.Label(self, text="Instructions", font=("Segoe UI", 16, "bold")).pack(
            anchor="w", pady=(0, 15))
        content = ttk.Frame(self)
        content.pack(fill="both", expand=True)
        self.text = tk.Text(content, wrap="word", state="disabled",
                            font=("Segoe UI", 11), padx=10, pady=10)
        self.text.tag_configure("bold", font=("Segoe UI", 11, "bold"))
        self.text.tag_configure("underline", underline=True)
        scrollbar = ttk.Scrollbar(content, orient="vertical", command=self.text.yview)
        self.text.configure(yscrollcommand=scrollbar.set)
        self.text.pack(side="left", fill="both", expand=True)
        scrollbar.pack(side="right", fill="y")

    def on_show(self):
        """Reload on each visit so saved edits appear without restarting."""
        try:
            contents = INSTRUCTIONS_FILE.read_text(encoding="utf-8-sig")
            if not contents.strip():
                contents = "Add your instructions to instructions.txt in the app folder."
        except FileNotFoundError:
            contents = "Add instructions.txt to the app folder to display your instructions here."
        except (OSError, UnicodeError) as error:
            contents = f"Could not read instructions.txt. Save it as UTF-8 text.\n\n{error}"
        self.text.configure(state="normal")
        self.text.delete("1.0", "end")
        for text, tags in formatted_segments(contents):
            self.text.insert("end", text, tags)
        self.text.configure(state="disabled")
        self.text.yview_moveto(0)
