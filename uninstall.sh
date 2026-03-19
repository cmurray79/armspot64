#!/bin/bash

# Clear and show the title (maybe a dimmed version for uninstallation)
clear
echo "Uninstalling armspot64..."

# 1. Remove the binary
if [ -f ~/.local/bin/armspot64 ]; then
    rm ~/.local/bin/armspot64
    echo "Removed binary: ~/.local/bin/armspot64"
fi

# 2. Remove the icon
if [ -f ~/.local/share/icons/spotify-client.png ]; then
    rm ~/.local/share/icons/spotify-client.png
    echo "Removed icon: ~/.local/share/icons/spotify-client.png"
fi

# 3. Remove the desktop menu entry
if [ -f ~/.local/share/applications/armspot64.desktop ]; then
    rm ~/.local/share/applications/armspot64.desktop
    echo "Removed menu entry: ~/.local/share/applications/armspot64.desktop"
fi

# 4. Refresh the system menu
if command -v lxpanelctl &> /dev/null; then
    lxpanelctl restart
fi

echo "-------------------------------------------------------"
echo "armspot64 has been successfully removed."
echo "Note: Your login data in ~/.config/armspot_profile was kept."
