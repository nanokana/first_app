require 'erb'

def foo
  a = "hello"
  erb = ERB.new("aの中身は<%= a %>です。")
  puts erb.result    #=> aの中身はbyeです。
end

a = "bye"
foo
