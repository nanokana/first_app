require 'erb'

a = "hello"
erb = ERB.new("aの中身は<%= a %>です。")
puts erb.result    #=> aの中身はhelloです。
