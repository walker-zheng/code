#!/usr/bin/python

class Switch(object):
    """The INVOKER class"""
    def __init__(self, flip_up_cmd, flip_down_cmd):
        self.flip_up = flip_up_cmd
        self.flip_down = flip_down_cmd

class Light(object):
    """The RECEIVER class"""
    def turn_on(self):
        print("The light is on")
    def turn_off(self):
        print("The light is off")

class LightSwitch(object):
    """The CLIENT class"""
    def __init__(self):
        lamp = Light()
        self._switch = Switch(lamp.turn_on, lamp.turn_off)

    def switch(self, cmd):
        cmd = cmd.strip().upper()
        if cmd == "ON":
            self._switch.flip_up()
        elif cmd == "OFF":
            self._switch.flip_down()
        else:
            print("Argument 'ON' or 'OFF' is required.")

# Execute if this file is run as a script and not imported as a module
if __name__ == "__main__":
    light_switch = LightSwitch()
    print("Switch ON test.")
    light_switch.switch("ON")
    print("Switch OFF test.")
    light_switch.switch("OFF")
    print("Invalid Command test.")
    light_switch.switch("****")
