class Apple
  def initialize
    @sweetness = rand(10) + 1
  end

  def sweetness
    @sweetness
  end
end

o1 = Apple.new    # リンゴ1を作成
o2 = Apple.new    # リンゴ2を作成
o3 = Apple.new    # リンゴ3を作成
p o1.sweetness    # リンゴ1の甘さを表示
p o2.sweetness    # リンゴ2の甘さを表示
p o3.sweetness    # リンゴ3の甘さを表示
p o1.sweetness    # リンゴ1の甘さを表示
p o2.sweetness    # リンゴ2の甘さを表示
p o3.sweetness    # リンゴ3の甘さを表示
