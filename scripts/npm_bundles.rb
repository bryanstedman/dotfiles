#!/usr/bin/env ruby
#
REINSTALL_ALL = ARGV[0] == "new"

puts "Making sure n exists"
if `which n` == "" || REINSTALL_ALL
  `npm install n -g --silent`
end

# n stable currently breaks, so hard coded for now
puts `n stable`
# `n 0.10.29`

puts "Running Node version: #{`node --version`}"

puts "Now we'll install the listed modules"
npms = {
  # module name => module command
  # leave command blank if they are the same
  "bower" => "",
  "grunt-cli" => "grunt",
  "gulp" => "",
  "slap" => ""
}

npms.each do |mod, command|
  cmd = (command == "" ? mod : command)
  if `which #{cmd}` == "" || REINSTALL_ALL
    puts "Installing #{mod}"
    `npm install #{mod} -g --silent`
  else
    puts "#{mod} is installed"
  end
end
