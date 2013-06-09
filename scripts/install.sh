dir=$(pwd) # dotfiles directory

echo "Brewing"

if test ! $(which brew)
then
  echo "  x You'll need to install Homebrew first:"
  echo "    https://github.com/mxcl/homebrew/wiki/installation"
  exit
fi

ruby $dir/scripts/brewery.rb

echo "~~~~~~~~~~~~~~~~~"

echo "Installing Oh My Zsh"
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
echo "~~~~~~~~~~~~~~~~~"

echo "Setting up npm"
ruby $dir/scripts/npm_bundles.rb $1
echo "~~~~~~~~~~~~~~~~~"


echo "Symlinking"

#symlinks
#zsh
echo "Creating local files"
touch $dir/zsh/local.zsh
touch ~/.oh-my-zsh/custom/aliases.zsh
touch ~/.oh-my-zsh/custom/functions.zsh
touch ~/.oh-my-zsh/themes/hipster.zsh-theme
touch ~/.gitconfig
touch ~/.gitignore_global

echo "Symlinking ZSH"
ln -sf $dir/zsh/.zshrc ~/.zshrc
ln -sf $dir/zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
ln -sf $dir/zsh/functions.zsh ~/.oh-my-zsh/custom/functions.zsh
ln -sf $dir/zsh/local.zsh ~/.oh-my-zsh/custom/local.zsh
ln -sf $dir/zsh/hipster.zsh-theme ~/.oh-my-zsh/themes/hipster.zsh-theme
echo "~~~~~~~~~~~~~~~~~"

#git
echo "Symlinking git"
ln -sf $dir/git/.gitconfig ~/.gitconfig
ln -sf $dir/git/.gitignore_global ~/.gitignore_global

echo "~~~~~~~~~~~~~~~~~"
echo "All done"