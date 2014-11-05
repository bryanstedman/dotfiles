puts 'Installing Atom packages'
puts '~~~~~~~~~~~~~~~~~'

packages = %w{
  emmet
  dash
  fancy-new-file
  merge-conflicts
  tasks
  valign  
}

packages.each do |package|
  puts `apm install #{package}`
end
