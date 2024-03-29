class Apple
  def initialize
    @sweetness = rand(10)
  end

  def sweetness
    @sweetness
  end

  def inspect
    "リンゴ(#{@sweetness})"
  end
end

class Fairy
  def pluck(tree)
    tree.shift
  end

  def carry(tree, basket)
    apple = pluck(tree)
    basket.push apple
    puts "よいしょ"
  end

  def eat(apple)
    if apple.sweetness > 3
      puts "甘くておいしい♪"
    else
      puts "すっぱいよ＞＜"
    end
  end

  def hungry?
    rand(3) == 0
  end

  def work(tree, basket)
    return if tree.empty?
    if hungry?
      apple = pluck(tree)
      eat apple
    else
      carry tree, basket
    end
  end
end

class Goblin < Fairy
  def work(tree, basket)
    if rand(2) == 0
      super
    else
      puts "めんどくさいなあ……"
    end
  end
end

tree = Array.new(7) { Apple.new }
basket = []
goblin = Goblin.new

while tree.size > 0
  goblin.work(tree, basket)
  print "tree   =>"
  p tree
  print "basket =>"
  p basket
end
