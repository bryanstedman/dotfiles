#!/usr/bin/env ruby

# Installs apps with brew-cask
puts 'Tapping homebrew-cask...'
puts 'brew tap phinze/homebrew-cask'
puts 'brew install brew-cask'

apps = %w{
  alfred
  atom
  bartender
  bettertouchtool
  boom
  codekit
  crashplan
  dash
  dropbox
  fantastical
  firefox
  ghostlab
  github
  google-chrome
  hazel
  hipchat
  iterm2
  limechat
  mailbox
  mamp
  nvalt
  opendns-updater
  opera
  scrivener
  sequel-pro
  shortcat
  sketch
  spectacle
  spotify
  textexpander
  things
  titanium-studio
  torbrowser
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
