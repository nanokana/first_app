filename = 'sample.txt'
text = File.readlines(filename)
text.each_with_index do |line, i|
  if line =~ /[Rr]uby/
    puts "#{i}: #{line}"
  end
end
