# -*- coding: utf-8 -*-
=begin
class AccTest
  def pub
    puts "pub is a public method."
  end

  public :pub #pubメソッドをpublicに設定（指定しなくてもよい）

  def priv
    puts "priv is a private method."
  end

  private :priv #privメソッドをprivateに設定
end

acc = AccTest.new
acc.pub
acc.priv
=end

class AccTest
  public #引数を指定しなければ、
  　　　　#これ以降に定義したメソッドはpublicになる
  def pub
    puts "pub is a public method."
  end

  private #これ以降に定義したメソッドはprivateになる

  def priv
    puts "priv is a privete method."
  end
end
