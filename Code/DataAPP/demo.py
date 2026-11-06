"""Content of the 'Demo' menu.

The Demo page looks exactly like the Data page, so it reuses its interface by building
on DataAcqPage (graph, console, Start/Stop, picture, movement list, FPGA connection).
For now it also behaves like the Data page. Override the methods you need below
(connect, disconnect, start, stop, on_new_data...) to give the demo its own behaviour.
The FPGA object is shared with the Data page: there is only one physical board.
"""
from dataAcq import DataAcqPage


class DemoPage(DataAcqPage):
    # If the demo needs its own dropdown choices, uncomment and edit these.
    # Otherwise they are inherited from the Data page.
    # movements = ("Movement A", "Movement B")

    # Example of a change of behaviour: log something different when recording starts.
    # def start(self):
    #     self.log("[Demo] Start pressed")
    #     super().start()
    pass