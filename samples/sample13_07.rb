class Apple
  def initialize
    @sweetness = rand(10) + 1
  end

  def sweetness
    @sweetness
  end
end

o1 = Apple.new    # �����S1���쐬
o2 = Apple.new    # �����S2���쐬
o3 = Apple.new    # �����S3���쐬
p o1.sweetness    # �����S1�̊Â���\��
p o2.sweetness    # �����S2�̊Â���\��
p o3.sweetness    # �����S3�̊Â���\��
p o1.sweetness    # �����S1�̊Â���\��
p o2.sweetness    # �����S2�̊Â���\��
p o3.sweetness    # �����S3�̊Â���\��
