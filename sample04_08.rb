# -*- coding: utf-8 -*-
puts "じゃんけん\n"
puts "グー　パー　チョキ を出して！！"
answer = gets #じゃんけんの手
puts "answer"
r = rand(3) + 1
if r == 1
  puts "グー"
elsif r == 2
  puts "チョキ"
elsif r == 3
  puts "パー"
end
