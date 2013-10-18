class Bar          # Barクラスの定義
  @@a = "Hello"    # クラス変数
  p @@a            #=> "Hello"
end

class Hoge         # Hogeクラスの定義 
  @@b = "Hi"       # クラス変数
  p @@a            #=> "Hi"
end

class Bar          # Barクラスの定義
  p @@a            #=> "Hello"
  p @@b            # @@bを参照できない
end
