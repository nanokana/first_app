puts "問題:日本で一番高い山は？"
puts "   1.白根山"
puts "   2.エベレスト"
puts "   3.富士山"
answer = gets.chomp
if answer ==  "1"
  puts "不正解です。"
elsif answer == "2"
  puts "不正解です。"
elsif answer == "3"
  puts "正解です！"
else
  puts "1-3を入力してください。"
end
