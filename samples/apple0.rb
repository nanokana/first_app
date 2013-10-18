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
end

tree = Array.new(3) { Apple.new }
basket = []

fairy = Fairy.new
p tree.size
fairy.pluck(tree)
p tree.size
