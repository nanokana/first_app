class Apple
  def initialize
    @sweetness = rand(10)
  end

  def sweetness
    @sweetness
  end

  def inspect
    "ƒŠƒ“ƒS(#{@sweetness})"
  end
end

class Fairy
  def pluck(tree)
    tree.shift
  end

  def carry(tree, basket)
    apple = pluck(tree)
    basket.push apple
    puts "‚æ‚¢‚µ‚å"
  end

  def eat(apple)
    if apple.sweetness > 3
      puts "ŠÃ‚­‚Ä‚¨‚¢‚µ‚¢ô"
    else
      puts "‚·‚Á‚Ï‚¢‚æ„ƒ"
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

tree = Array.new(7) { Apple.new }
basket = []
fairy = Fairy.new

while tree.size > 0
  fairy.work(tree, basket)
  print "tree   =>"
  p tree
  print "basket =>"
  p basket
end
