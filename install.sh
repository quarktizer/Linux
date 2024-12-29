#!/bin/bash

# List of packages to install
packages=(
  "i3"
  "git"
  "vim"
  "curl"
  "kitty"
  "polybar"
  "ufw"
  "timeshift"
  "ranger"
  "clang"
  "g++"
  "gcc"
  "rofi"
  "dunst"
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

echo "All packages installed successfully!"
