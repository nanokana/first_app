filenames = Dir.glob('data/*.txt')
filenames.each do |filename|
  puts filename
end
