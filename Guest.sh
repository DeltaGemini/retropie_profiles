#!/bin/bash
# Switch to Guest profile

switch_to_guest() {
    echo "Guest" > /home/pi/RetroPie/profiles/current_profile

    # Update all RetroArch configuration files
    for cfg in /opt/retropie/configs/*/retroarch.cfg; do
        sed -i 's|^savefile_directory = .*|savefile_directory = "/home/pi/RetroPie/saves/guest"|' "$cfg"
        sed -i 's|^savestate_directory = .*|savestate_directory = "/home/pi/RetroPie/savestates/guest"|' "$cfg"
    done
}

attempt=0
max_attempts=3

while [ $attempt -lt $max_attempts ]; do
    switch_to_guest
    sleep 5
    CURRENT_PROFILE=$(cat /home/pi/RetroPie/profiles/current_profile)
    if [ "$CURRENT_PROFILE" == "Guest" ]; then
        cp /home/pi/RetroPie/profiles/photos/Guest.png /home/pi/RetroPie/profiles/photos/current.png
        echo "Switched to profile: Guest successfully!"
        exit 0
    else
        echo "Error: Failed to switch to Guest profile. Attempt $((attempt + 1)) of $max_attempts."
        attempt=$((attempt + 1))
    fi
done

echo "Failed to switch to profile: Guest after $max_attempts attempts. Exiting."
sleep 3
exit 1
