# -*- coding: utf-8 -*-
scene = 'opening'
while true
  case scene
  when 'opening'
    puts '3本の分かれ道があります。どの道を進みますか？'
    puts " 1 左に道"
    puts " 2 真ん中の道"
    puts " 3 左の道"
    input_value = gets
    case input_value.to_i
    when 1
      scene = 'left'
    when 2
      scene = 'center'
    when 3
      scene = 'right'
    end
  when 'left'
    puts 'あっ!'
    sleep 1
    puts '落とし穴に落ちてしまいました。'
    puts '~ GAME OVER ~'
    exit #プログラムを終了
  when 'center'
    puts '真ん中の道をまっすぐ歩いて行くと......'
    sleep 1
    puts '宝箱を見つけました!'
    puts " 1 そのままにしておく"
    puts " 2 あける"
    input_value = gets
    case input_value.to_i
    when 1
      scene = 'leave'
    when 2
      scene = 'ending'
    end
  when 'right'
    puts 'しばらく歩き続けると　もとの場所にもどってしまいました。'
    sleep 1
    scene = 'opening'
  when 'leave'
    puts '宝箱には見向き燃せず】お家に帰りました。'
    puts '~ GAME OVER ~'
    exit #プログラムを終了
  when 'ending'
    puts 'パカッ'
    sleep 1
    puts 'まばゆい光があふれだす......'
    sleep 2
    puts '100枚の金貨を手に入れました！'
    sleep 3
    puts ' シナリオ　だん'
    sleep 2
    puts ' プログラム　だん'
    sleep 2
    puts ' ~END~'
    exit #プログラムを終了
  end
end
