#!/usr/bin/env python3
import subprocess
import os
import time
from pathlib import Path

def launch_armspot64():
    # Use Path.home() to make it user-agnostic
    user_config = Path.home() / ".config/armspot_profile"
    
    command = [
        "chromium",
        "--app=https://open.spotify.com",
        f"--user-data-dir={user_config}",
        "--disable-extensions",
        "--disable-sync",
        "--process-per-site",
        "--enable-gpu-rasterization",
        "--window-size=1200,800"
    ]
    
    try:
        proc = subprocess.Popen(command, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        while proc.poll() is None:
            time.sleep(1)
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    launch_armspot64()
