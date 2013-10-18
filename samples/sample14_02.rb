lines = File.readlines('hello.txt')
lines.each_with_index do |line, i|
  print "#{i + 1}: #{line}"
end
