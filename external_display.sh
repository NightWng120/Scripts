#!/bin/sh

# Check if HDMI-2 is physically connected
if xrandr | grep -q "HDMI-2 connected"; then
        # --- DOCK SETUP ---
            xrandr --output HDMI-2 --mode 1920x1080 --primary --output eDP-1 --auto --left-of HDMI-2
                sleep 1
                    pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:hdmi-stereo
                        pactl set-default-sink alsa_output.pci-0000_00_1f.3.hdmi-stereo
                    else
                            # --- UNDOCK SETUP ---
                                xrandr --output eDP-1 --primary --auto --output HDMI-2 --off
                                    sleep 0.5
                                        pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:analog-stereo
                                            pactl set-default-sink alsa_output.pci-0000_00_1f.3.analog-stereo
fi

