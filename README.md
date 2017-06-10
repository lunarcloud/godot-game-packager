# Godot Game Installer Creation Scripts
Create installers for Godot games for Windows, Mac, and Linux (Debian / Ubuntu).

## Environment
This was made to run on Linux. I'd recommend running on Linux, whether natively or via a virtual machine like [VirtualBox](https://www.virtualbox.org).

You will need [Cygwin](https://www.cygwin.com/) or [WSL](https://msdn.microsoft.com/commandline/wsl/about) to run on Windows.

It may not work on macOS. Patches to script-dialog and/or this to make it work would be welcome.

## Instructions
  1. Create a folder for your installer project
  2. Drop your Godot game exports and "*.pck" data into this folder
  3. Make sure the linux exports are marked as executable ( `sudo chmod +x *.amd64 *.x86` )
  4. Create the game.png
  5. Create your gameinfo.conf
  6. (Optional) create the company.png
  7. (Optional) create a license.txt
  8. Run gui.sh or individually run build-* scripts
  9. ???
  10. Profit!
