#!/usr/bin/env ruby

puts "Installing homebrew-cask..."
# puts 'brew tap phinze/homebrew-cask'
puts "brew install caskroom/cask/brew-cask"

brews = %w{
  ack
  bar
  brew-cask
  ctags
  gifsicle
  git
  git-extras
  git-flow
  ffmpeg
  heroku-toolbelt
  imagemagick
  mongodb
  mysql
  node
  phantomjs
  rbenv
  ruby-build
  tig
  tree
  vim
  wget
}

puts "Before doing anything, going to update brew"
`brew update`


installed = `brew ls`
brews.each do |brew|
  if(installed.include? brew)
    puts "#{brew} already installed"
  else
    puts "running brew install #{brew}"
    puts `brew install #{brew}`
  end
end
