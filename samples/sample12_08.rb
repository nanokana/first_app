def hello
  puts "Hello"
  return        # ここでメソッドの実行は終了
  puts "bye"    # 実行されない
end

hello    #=> Hello
