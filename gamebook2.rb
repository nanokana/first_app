# -*- coding: utf-8 -*-
msg0 = "3 本の分かれ道があります。どの道を進みますか。\n" +
  " 1 左の道\n 2 真ん中の道\n 3 右の道"
msg1 = "あっ！\n落とし穴に落ちていました。\n~ GAME" +
  "OVER ~"
msg2 = "真ん中の道をまっすぐ歩いて行くと......\n宝箱をみつ" +
  "けました！\n 1  そのままにしておく\n 2 あける"
msg3 = "しばらく歩き続けるると　もとの場所に戻ってしまい" + 
  "ました。\n 1 次へ"
msg4 = "宝箱には見向きもせず　お家に帰りました。 \n~ GAM" +
  "E OVER ~"
msg5 = "パカッ\nまばゆい光があふれだす......\n100枚の金貨" +
  "を手に入れた。"

tbl = [
       [msg0,  1,  2,  3],
       [msg1,nil,nil,nil],
       [msg2,  4,  5,nil],
       [msg3,  0,nil,nil],
       [msg4,nil,nil,nil],
       [msg5,nil,nil,nil]
]

scene = 0
while true
  scene_data = tbl[scene]
  message = scene_data[0]
  puts message

  if scene_data[1] == nil
    exit
  end

  print ' 数学を入力してください '
  input_value = gets.to_i

  if input_value > 0
    next_scene = scene_data[input_value]
    if  next_scene == nil
    puts '不正な値が入力されました'
    else
      scene =next_scene
    end
  else
    puts '不正な値が入力がされました'
  end

  sleep 0.5
  print "\n"
end
