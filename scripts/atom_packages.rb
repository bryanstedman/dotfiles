#!/usr/bin/env ruby

packages = %w{
  merge-conflicts
  tasks
}

installed = `apm ls`
packages.each do |package|
  if(installed.include? package)
    puts "#{package} already installed"
  else
    puts "running apm install #{package}"
    puts `apm install #{package}`
  end
end
