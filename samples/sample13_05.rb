class Apple
  def sweetness
    rand(10) + 1
  end
end

o1 = Apple.new    # ƒŠƒ“ƒS1‚ğì¬
o2 = Apple.new    # ƒŠƒ“ƒS2‚ğì¬
o3 = Apple.new    # ƒŠƒ“ƒS3‚ğì¬
p o1.sweetness    # ƒŠƒ“ƒS1‚ÌŠÃ‚³‚ğ•\¦
p o2.sweetness    # ƒŠƒ“ƒS2‚ÌŠÃ‚³‚ğ•\¦
p o3.sweetness    # ƒŠƒ“ƒS3‚ÌŠÃ‚³‚ğ•\¦
