class Bar          # Bar�N���X�̒�`
  @@a = "Hello"    # �N���X�ϐ�
  p @@a            #=> "Hello"
end

class Hoge         # Hoge�N���X�̒�` 
  @@b = "Hi"       # �N���X�ϐ�
  p @@a            #=> "Hi"
end

class Bar          # Bar�N���X�̒�`
  p @@a            #=> "Hello"
  p @@b            # @@b���Q�Ƃł��Ȃ�
end
