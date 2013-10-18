# -*- coding: utf-8 -*-
def total(from, to)
  result = 0 #合計の値
  from.upto(to) do |num| #fromからtoまで処理する
    if block_given? # ブロックがあれば
      result += yield(num)
    else
      result += num
    end
  end
  return result #メソッドの結果を返す
end

p total(1, 10) #1から10の和 => 55
p total(1, 10) #1から10の2乗の和　=> 385
