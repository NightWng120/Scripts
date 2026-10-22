#!/bin/bash

# Define names
CARD="alsa_card.pci-0000_00_1f.3"
LAPTOP_SINK="alsa_output.pci-0000_00_1f.3.analog-stereo"
HDMI_SINK="alsa_output.pci-0000_00_1f.3.hdmi-stereo"

# Check if the laptop speakers are currently active in your active sinks list
if pactl list short sinks | grep -q "$LAPTOP_SINK"; then
    # Laptop is running -> Switch hardware card profile to HDMI, then route sound to it
    pactl set-card-profile "$CARD" output:hdmi-stereo
    pactl set-default-sink "$HDMI_SINK"
else
    # Laptop speaker sink is hidden/absent -> Switch hardware back to analog speakers
    pactl set-card-profile "$CARD" output:analog-stereo
    pactl set-default-sink "$LAPTOP_SINK"
fi

