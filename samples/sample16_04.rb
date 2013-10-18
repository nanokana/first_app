require 'erb'

def foo
  a = "hello"
  erb = ERB.new("aの中身は<%= a %>です。")
  puts erb.result(binding)    #=> aの中身はhelloです。
end

a = "bye"
foo
