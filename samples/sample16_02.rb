require 'erb'

a = "hello"
erb = ERB.new("a�̒��g��<%= a %>�ł��B")
puts erb.result    #=> a�̒��g��hello�ł��B
