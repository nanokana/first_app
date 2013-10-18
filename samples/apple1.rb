class Apple
  def initialize
    @sweetness = rand(10)
  end

  def sweetness
    @sweetness
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
end

tree = Array.new(3) { Apple.new }
basket = []
fairy = Fairy.new

while tree.size > 0
  fairy.carry(tree, basket)
  p basket.size
end
