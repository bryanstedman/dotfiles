Bryan's dotfiles
========

My OS X dotfiles. Most of these are stolen from other people.

## Installing

### Automatic Installation
You can install everything via `curl`:  
`$ curl -L http://bryanstedman.github.io/dotfiles/install.sh | sh`

### Manual Installation
If you'd prefer to install things manually:
* Clone this repo to ~/.dotfiles (`cd ~ && git clone https://github.com/bryanstedman/dotfiles.git .dotfiles`)  
* cd into this folder (`cd .dotfiles`)  
* run install script (`./scripts/install.sh`)  
* if you have a permission issue than make sure the script is executable (`chmod +x scripts/install.sh`)

## Updating
You can check for updates by simply running a git pull from your ~/.dotfiles directory. Alternatively, you can use the included alias `updatedotfiles`

## Requirements
These dotfiles assume that you have Ruby installed.
Git, [Homebrew](http://brew.sh/) and [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) are also necessary, but the install script will get those installed for you if needed.

## Customizing
These files provide a local.zsh file in the zsh folder for your own aliases and functions or pieces that are specific to one machine.  

You will also want to update git/.gitconfig with your name and email rather than mine
