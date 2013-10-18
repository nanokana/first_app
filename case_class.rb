array = ["a", 1,nil]
array.each do |item|
  case item
    when String
    puts "item is a String."
    when Numeric
puts "item is a Numric."
    else
    puts "item is something."
  end
end
