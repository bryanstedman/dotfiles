# Script for bootstraping a new system
# This script installs custom dotfiles, apps and system preferances 

dir=$(pwd) # dotfiles directory

echo "~~~~~~~~~~~~~~~~~~~"
echo "Installing dotfiles"

$dir/scripts/install.sh


echo "~~~~~~~~~~~~~~~~~~~"
echo "Installing Apps"
ruby $dir/scripts/cask.rb  

echo "~~~~~~~~~~~~~~~~~~~"
echo "Setting OSX preferances"

$dir/osx/.osx 