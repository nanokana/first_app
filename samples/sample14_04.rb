filename = ARGV[0]
text = File.readlines(filename)
text.each_with_index do |line, i|
  puts "#{i}: #{line}"
end
