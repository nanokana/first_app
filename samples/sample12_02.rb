$var = 1000    # グローバル変数

def foo        # メソッド定義
  puts $var    # varを参照できないのでエラー
end

foo    #=> 1000
