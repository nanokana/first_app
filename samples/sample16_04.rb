require 'erb'

def foo
  a = "hello"
  erb = ERB.new("a�̒��g��<%= a %>�ł��B")
  puts erb.result(binding)    #=> a�̒��g��hello�ł��B
end

a = "bye"
foo
