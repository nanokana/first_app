a = {
  "tomato" => 120,
  "potato" =>  50,
  "carrot" =>  30,
}
name = gets.chomp
price = a[name]
if price
  puts "#{name}�̒l�i�́A#{price}�~�ł��B"
else
  puts "#{name}�̒l�i�́A�o�^����Ă��܂���B"
end
