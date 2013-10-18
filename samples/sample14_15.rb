filenames = Dir.glob('data/*.txt')
filenames.each do |filename|
  text = File.read(filename)
  puts text
end
