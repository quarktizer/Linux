#!/bin/bash

# List of packages to install
packages=(
  # System Utilities
  "coreutils"      # Essential system utilities
  "htop"           # System monitoring
  "neofetch"       # System information tool
  "ufw"            # Firewall
  "tlp"            # Power management
  "timeshift"      # Backup tool
  "xinit"          # X11 initialization
  "xbacklight"     # Screen brightness control
  "pulseaudio"     # Audio Server
  "kitty"          # Terminal emulator
  "ranger"         # File manager (CLI-based)
  "cpufrequtils"   # Power management
  "tlp-rdw"        # Power management

  # Development Tools
  "git"            # Version control
  "gcc"            # C compiler
  "g++"            # C++ compiler
  "clang"          # Clang compiler
  "python3"        # Python 3 interpreter
  "tmux"           # Terminal multiplexer
  "vim"            # Text editor

  # Window Management / Desktop Environment
  "i3"             # Tiling window manager
  "lightdm"        # Display manager
  "rofi"           # Application launcher
  "polybar"        # Status bar for i3
  "picom"          # Compositor for X11
  "dunst"          # Notification daemon




)


# Function to install packages and check for errors
install_package() {
  package=$1
  echo "Installing $package..."
  
  # Try to install the package
  sudo apt install -y "$package"
  
  # Check if the last command was successful
  if [ $? -ne 0 ]; then
    echo "Error: Failed to install $package"
    exit 1  # Exit the script if an error occurs
  else
    echo "$package installed successfully!"
  fi
}

# Update package list
echo "Updating package list..."
sudo apt update
if [ $? -ne 0 ]; then
  echo "Error: Failed to update package list."
  exit 1
fi

# Install each package
for package in "${packages[@]}"; do
  install_package "$package"
done

# Enable and start lightdm
echo "Enabling LightDM..."
sudo apt install lightdm-gtk-greeter
sudo systemctl enable lightdm
# Enable and start tlp
sudo systemctl enable tlp
sudo systemctl start tlp



#Create first Timeshift backup
echo "Creating Timeshift backup..."
sudo timeshift --create --comment "Install.sh Backup" --tags D



# Suggest next steps:
echo "Installation complete. Now setting up i3..."
echo "1. Configure your i3 status bar (Polybar)."
echo "2. Set up your application launcher (Rofi)."
echo "3. Launch picom for compositing (you can add 'picom & ' to i3 config)."
echo "4. Optionally, set up Timeshift for automatic backups."

echo "All packages installed successfully!"



