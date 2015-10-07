if test ! $(which ruby)
then
  echo "You need to install ruby first"
else

  cd ~

  dir=$(pwd) # dotfiles directory

  if test ! $(which brew)
  then
    echo "  x You'll need to install Homebrew first:"
    # echo "    https://github.com/mxcl/homebrew/wiki/installation
    echo " Installing Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    exit
  fi

  if test ! $(which git)
  then
    echo "Installing Git"
    brew install git
    exit
  fi

  echo "Cloning dotfiles repo"
  git clone https://github.com/bryanstedman/dotfiles.git $dir/.dotfiles


  echo "Brewing"
  ruby $dir/.dotfiles/scripts/brewery.rb

  echo "Installing brew cask applications"
  ruby $dir/.dotfiles/scripts/cask.rb

  echo "~~~~~~~~~~~~~~~~~"

  echo "Installing Oh My Zsh"
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
  echo "~~~~~~~~~~~~~~~~~"

  echo "Applying OSX settings"
  $dir/.dotfiles/osx/.osx
  echo "~~~~~~~~~~~~~~~~~"

  echo "Setting up npm"
  ruby $dir/.dotfiles/scripts/npm_bundles.rb $1
  echo "~~~~~~~~~~~~~~~~~"


  echo "Symlinking"

  #symlinks
  #zsh
  echo "Creating local files"
  touch $dir/.dotfiles/zsh/local.zsh
  touch ~/.oh-my-zsh/custom/aliases.zsh
  touch ~/.oh-my-zsh/custom/functions.zsh
  touch ~/.oh-my-zsh/themes/hipster.zsh-theme
  touch ~/.gitconfig
  touch ~/.gitignore_global

  echo "Symlinking ZSH"
  ln -sf $dir/.dotfiles/zsh/.zshrc ~/.zshrc
  ln -sf $dir/.dotfiles/zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
  ln -sf $dir/.dotfiles/zsh/functions.zsh ~/.oh-my-zsh/custom/functions.zsh
  ln -sf $dir/.dotfiles/zsh/local.zsh ~/.oh-my-zsh/custom/local.zsh
  ln -sf $dir/.dotfiles/zsh/hipster.zsh-theme ~/.oh-my-zsh/themes/hipster.zsh-theme
  echo "~~~~~~~~~~~~~~~~~"

  #git
  echo "Symlinking git"
  ln -sf $dir/.dotfiles/git/.gitconfig ~/.gitconfig
  ln -sf $dir/.dotfiles/git/.gitignore_global ~/.gitignore_global
  echo "~~~~~~~~~~~~~~~~~"

  # Atom Editor settings
  echo "Symlinking atom editor settings"
  touch ~/.atom/config.cson
  touch ~/.atom/init.coffee
  touch ~/.atom/keymap.cson
  touch ~/.atom/snippets.cson
  touch ~/.atom/styles.less

  ln -sf $dir/.dotfiles/atom/config.cson ~/.atom/config.cson
  ln -sf $dir/.dotfiles/atom/init.coffee ~/.atom/init.coffee
  ln -sf $dir/.dotfiles/atom/keymap.cson ~/.atom/keymap.cson
  ln -sf $dir/.dotfiles/atom/snippets.cson ~/.atom/snippets.cson
  ln -sf $dir/.dotfiles/atom/styles.less ~/.atom/styles.less


  echo "~~~~~~~~~~~~~~~~~"
  echo "All done"

fi