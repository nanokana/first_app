s = "---abc3xyz---"
if s =~ /abc[1-7]xyz/
  puts "#{$&}という文字列を見つけました。"
end
