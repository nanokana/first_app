test = ''
fname = 'dummy.txt'
begin
  text = File.read(fname)
rescue
  puts "ファイル<#{fname}>の読み込みに失敗しました"
end
