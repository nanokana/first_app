require 'erb'
erb = ERB.new("����ɂ��́B\n���N��<%= Time.new.year %>�N�ł��B")
puts erb.result
