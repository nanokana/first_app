require 'erb'

def foo
  a = "hello"
  erb = ERB.new("a�̒��g��<%= a %>�ł��B")
  puts erb.result    #=> a�̒��g��bye�ł��B
end

a = "bye"
foo
