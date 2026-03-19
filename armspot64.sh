#!/bin/bash

echo "                       ______________________________________________   _____  "
echo "_____ _______  _____  /   _____/\______   \_____  \__    ___/  _____/  /  |  | "
echo "\__  \\_  __ \/     \ \_____   \  |     ___//   |   \|    | /   __  \  /   |  |_"
echo " / __ \|  | \/  Y Y  \/        \ |    |   /    |    \    | \  |__\  \/    ^   /"
echo "(____  /__|  |__|_|  /_______  / |____|   \_______  /____|  \_____  /\____   | "
echo "     \/            \/        \/                   \/              \/      |__| "

echo "Starting armspot64 installation..."

# 1. Install prerequisites (pynput for keys, xdotool for window control)
sudo apt update
sudo apt install -y python3-pynput xdotool libwidevinecdm0

# 2. Prepare the binary
mkdir -p ~/.local/bin
# Copy your python script to a binary name
cp armspot64.py ~/.local/bin/armspot64
# Ensure the shebang is correct and make it executable
chmod +x ~/.local/bin/armspot64

# 3. Handle the Icon
# Moves the icon to a standard local icon path so the .desktop file can find it by name
mkdir -p ~/.local/share/icons
cp icon.png ~/.local/share/icons/armspot64.png

# 4. Install the Desktop Menu Entry
mkdir -p ~/.local/share/applications
cp armspot64.desktop ~/.local/share/applications/

# 5. Refresh the system menu
if command -v lxpanelctl &> /dev/null; then
    lxpanelctl restart
fi

echo "-------------------------------------------------------"
echo "Installation complete!"
echo "You can now find 'armspot64' in the Sound & Video menu."
echo "Note: You may need to log out and back in for changes to fully take effect."
