require 'erb'
erb = ERB.new("こんにちは。\n今年は<%= Time.new.year %>年です。")
puts erb.result
