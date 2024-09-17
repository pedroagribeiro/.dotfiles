#!/usr/bin/env python3
import subprocess

LAPTOP_DISPLAY = "eDP-1"
HOME_EXTERNAL_DISPLAY = "DP-1"

STANDALONE_SETUP = (LAPTOP_DISPLAY)
HOME_SETUP = (LAPTOP_DISPLAY, HOME_EXTERNAL_DISPLAY)

def get_connected_displays():
    output = [l for l in subprocess.check_output(["xrandr"]).decode("utf-8").splitlines()]
    return [l.split()[0] for l in output if " connected " in l]

def setup_displays_with_bspwm(connected_displays):
    if sorted(connected_displays) == sorted(HOME_SETUP):
        setup_home_setup()
    else:
        setup_standalone_setup()

def setup_home_screens():
    subprocess.run(["xrandr", "--output", HOME_EXTERNAL_DISPLAY, "--auto", "--primary"])
    subprocess.run(["xrandr", "--output", HOME_EXTERNAL_DISPLAY, "--mode", "1920x1080", "--rate", "119.98"])
    subprocess.run(["xrandr", "--output", LAPTOP_DISPLAY, "--off"])

def setup_home_keyboard():
    subprocess.run(["setxkbmap", "us"])

def setup_standalone_screens():
    subprocess.run(["xrandr", "--output", LAPTOP_DISPLAY, "--auto", "--primary"])
    subprocess.run(["xrandr", "--ouptut", LAPTOP_DISPLAY, "--mode", "1920x1080"])

def setup_standalone_keyboard():
    subprocess.run(["setxkbmap", "pt"])

def setup_bspwm():
    subprocess.run((["bspc", "monitor", "-d", "1", "2", "3", "4", "5", "6", "7", "8", "9"]))

def setup_home_setup():
    setup_home_screens()
    setup_home_keyboard()
    setup_bspwm()

def setup_standalone_setup():
    setup_standalone_screens()
    setup_standalone_keyboard()
    setup_bspwm()

if __name__ == "__main__":
    connected_displays = get_connected_displays()
    setup_displays_with_bspwm(connected_displays)
