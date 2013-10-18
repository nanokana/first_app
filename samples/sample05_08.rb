a = 1
while true
  a *= 2
  puts a
  if a > 10
    break    # whileによるループを抜け出す
  end
end
puts "ループを抜けました"
