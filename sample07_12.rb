# -*- coding: utf-8 -*-
class Bar #Barクラスの定義
  @@a = "Hello" #クラス定義
  p @@a #=> "Hello"
end

class Hoge #Hageのクラスの定義
  @@b = "Hi" #クラス変数
  p @@a #クラス変数
end

class Bar #Barクラスの定義
  p @@a #=>"Hello"
  p @@b #@@bを参照できない
end
