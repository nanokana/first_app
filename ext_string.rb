# -*- coding: utf-8 -*-
class String
  def count_word
    ary = self.split(/\s+/) #レシーバを空白文字で分解する
    return ary.size #分解後の配列の要素数を返す
  end
end

str = "Just Another Ruby Newbie"
p str.count_word #=> 4
