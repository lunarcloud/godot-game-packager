# Godot Game Installer Creation Scripts
Create installers for Godot games for Windows, Mac, and Linux (Debian / Ubuntu).


## Prerequisites
This was made to run on Linux.
If you don't have Linux running yet, I suggest installing [VirtualBox](https://www.virtualbox.org) and installing the latest LTS version of [Ubuntu](https://www.ubuntu.com/download/desktop) on it.

Then run the following command in the terminal which will install an icon converter tool for the macOS builder and the Windows installer creation tool NSIS:

`sudo apt install icnsutils nsis`


## Instructions
  1. Create a folder for your installer project
  2. Drop your Godot game exports and "*.pck" data into this folder
  3. Make sure the linux exports are marked as executable ( `sudo chmod +x *.amd64 *.x86` )
  4. Create the game.png
  5. Create your gameinfo.conf
  6. (Optional) create the company.png
  7. (Optional) create a license.txt
  8. Run gui.sh
