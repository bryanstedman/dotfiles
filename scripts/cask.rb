#!/usr/bin/env ruby

# Installs apps with brew-cask
puts 'Tapping homebrew-cask...'
puts 'brew tap phinze/homebrew-cask'
puts 'brew install brew-cask'

apps = %w{
  alfred
  atom
  bartender
  boom
  dropbox
  fantastical
  firefox
  ghostlab
  hazel
  iterm2
  mailbox
  mamp
  nvalt
  opendns-updater
  scrivener
  sequel-pro
  shortcat
  spectacle
  superduper
  textexpander
  things
  vlc
  xquartz
}

puts 'brew cask install alfred'

installed = `brew cask list`
apps.each do |app|
  if(installed.include? app)
    puts "#{app} already installed"
  else
    puts "running brew cask install #{app}"
    puts `brew cask install #{app}`
  end
end

# Tell Alfred about cask apps straight away
puts 'brew cask alfred link'
