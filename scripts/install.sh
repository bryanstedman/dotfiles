dir=$(pwd) # dotfiles directory

echo "Brewing"
ruby $dir/scripts/brewery.rb

echo "~~~~~~~~~~~~~~~~~"
echo "Symlinking"

#symlinks
#zsh
echo "Creating local alias file"
touch $dir/zsh/local.zsh

echo "Symlinking ZSH"
ln -sf $dir/zsh/.zshrc ~/.zshrc
ln -sf $dir/zsh/aliases.zsh ~/.ohmyzsh/custom/aliases.zsh
ln -sf $dir/zsh/functions.zsh ~/.ohmyzsh/custom/functions.zsh
ln -sf $dir/zsh/local.zsh ~/.ohmyzsh/custom/local.zsh
ln -sf $dir/zsh/hipster.zsh-theme ~/.ohmyzsh/themes/hipster.zsh-theme

#git
echo "Symlinking git"
ln -sf $dir/git/.gitconfig ~/.gitconfig
ln -sf $dir/git/.gitignore_global ~/.gitignore_global

echo "~~~~~~~~~~~~~~~~~"
echo "All done"