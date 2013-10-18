#!/usr/local/bin/ruby

require 'launcher'

# Script to invoke launcher using command-line args
def help
  print "
  You must pass in the path to the file to launch.

  Usage: #{__FILE__} target_file
"
end

unless ARGV.size > 0
  help
  exit
else
  app_map = {
    'html' => 'Safari'
    'txt' => 'emacs'
    'jpg' => 'gimp'
  }

  l = Launcher.new( app_map )
  target = ARGV.join( ' ' )
  l.run( target )
end
