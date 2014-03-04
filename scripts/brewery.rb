#!/usr/bin/env ruby

puts "Tapping homebrew-cask..."
puts 'brew tap phinze/homebrew-cask'

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

# Dependancies for gifify function
puts 'brew cask install x-quartz'
puts 'open /usr/local/Cellar/x-quartz/2.7.4/XQuartz.pkg'