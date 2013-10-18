# -*- coding: utf-8 -*-
class Point
  attr_reader :x, :y

  def initialize(x=0, y=0)
    @x, @y = x, y
  end

  def inspect #表示用
    "(#{x}, #{y})"
  end

  def + (other) #x,yのそれぞれを足す
    self.class.new(x + other.x, y + other.y)
  end

  def - (other) #x,yのそれぞれを引く
    self.class.new(x - other.x, y - other.y)
  end
end

point0 = Point.new(3,6)
point1 = Point.new(1,8)

p point0 #=>(3,6)
p point1 #=>(1,8)
p point0 + point1 #=> (4,14)
p point0 - point1 #=> (2,-2)
