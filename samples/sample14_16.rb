Dir.glob('data/*.txt').each do |filename|
  puts File.read(filename)
end
