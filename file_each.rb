# -*- coding: utf-8 -*-
file = File.open("hash_each.rb") #" "に開くファイルを入力する
file.each_line do |line|
  print line
end
file.close
