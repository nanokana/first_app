# -*- coding: utf-8 -*-
require "./grep" #grep.rbの読み込み

pattern = Regexp.new(ARGV[0])
filename = ARGV[1]
simple_grep(pattern, filename) #simple_grepメソッドの起動
