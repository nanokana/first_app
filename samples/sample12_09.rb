def warizan(a, b)
  if b == 0
    puts "割る数が0です!"
    return
  end
  puts a / b
end

warizan(10, 2)    #=> 5
warizan(10, 0)    #=> 割る数が0です!
