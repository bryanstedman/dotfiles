#!/usr/bin/env ruby

brews = %w{
  ack
  ctags
  git
  mongodb
  node
  phantomjs
  rbenv
  ruby-build
  wget
  vim
  ffmpeg
  brew-cask
  gifsicle
  imagemagick
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
puts 'brew tap phinze/homebrew-cask'
puts 'brew cask install x-quartz'
puts 'open /usr/local/Cellar/x-quartz/2.7.4/XQuartz.pkg'