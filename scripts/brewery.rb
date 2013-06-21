#!/usr/bin/env ruby

puts "Tapping homebrew-cask..."
puts 'brew tap phinze/homebrew-cask'

brews = %w{
  ack
  ctags
  git
  git-extras
  git-flow
  mongodb
  node
  phantomjs
  rbenv
  ruby-build
  wget
  vim
  ffmpeg
  brew-cask
  tig
  gifsicle
  imagemagick
  heroku-toolbelt
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