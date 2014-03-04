#!/usr/bin/env ruby

# Installs apps with brew-cask
puts 'Tapping homebrew-cask...'
puts 'brew tap phinze/homebrew-cask'
puts 'brew install brew-cask'

apps = %w{
  alfred
  bartender
  cheat-sheet
  chocolat
  clean-my-mac
  codekit
  dropbox
  fantastical
  filezilla
  firefox
  github
  google-chrome
  google-chrome-canary
  handbrake
  hip-chat
  iterm2
  keyboard-maestro
  lime-chat
  mamp
  opera
  scrivener
  sequel-pro
  shortcat
  spectacle
  spotify
  sublime-text
  textexpander
  things
  vlc
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