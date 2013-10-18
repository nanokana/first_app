 require "guiutil.rb"
 require "scenario.rb"
 
 #--------------------------------------
 #    初期化処理
 #--------------------------------------
 def init
   # ウィンドウの作成
   create_screen "Visual Novel", 480, 360
   # GUI システム開始
   start_gui
 
   # グローバル変数の初期化
   $font_size = 12    # フォントの表示サイズ
   $scene = 'opening' # 場面 ID
   $fonts = []        # フォントオブジェクト格納用の配列
   $bg_image = nil    # 背景オブジェクトを代入する変数
   $quit_button = nil # 終了ボタンオブジェクトを代入する変数
 end
 
 #--------------------------------------
 #    メインループ
 #--------------------------------------
 def mainloop(tbl)
   while true
     # シーンデータ取り出し
     scene_data = tbl[$scene]
 
     # 背景画像が指定されていれば表示する
     bg_fname = scene_data[0][0]
     if bg_fname
       $bg_image = create_img 0, 0, bg_fname
     end

     # 終了ボタンの表示
     $quit_button = create_img_button 0, 438, 180, "quiticon0.gif", "quiticon1.gif"
 
     # メッセージの表示
     message = scene_data[0][1]
     font = create_font message, 24,218, $font_size
     $fonts.push font
 
     # 選択肢メッセージの表示
     (scene_data.size-1).times do |i|
       sleep 0.2
       idx = i+1
       ch_msg = "#{idx}. #{scene_data[idx][1]}"
       font = create_font_button idx, ch_msg, 24, 270+i*24, $font_size
       $fonts.push font
     end

     # ボタンの入力待ち
     input_value = get_button_id
     # ボタン ID が 0 なら終了
     if input_value == 0
       finish
     end
     # 選択されたフォントを水色にする
     $fonts[input_value].color "#88FFFF"
 
     # 次のシーン ID を取り出す
     $scene = scene_data[input_value][0]
     # nil なら終了
     if $scene == nil
       finish
     end

     # 画面を黒い四角で塗りつぶす
     block_mask

     # 表示物を削除
     delete_items
   end
 end
 
 #--------------------------------------
 #    表示物の削除
 #--------------------------------------
 def delete_items2()
   # 表示中の終了ボタンを削除
   if $quit_button
     $quit_button.delete
     $quit_button = nil
   end
 end

 #--------------------------------------
 #    表示物の削除
 #--------------------------------------
 def delete_items
   # 表示中のフォントを削除
   $fonts.size.times do |idx|
     $fonts[idx].delete
   end
   $fonts = []

   # 表示中の背景画像を削除
   if $bg_image
     $bg_image.delete
     $bg_image = nil
   end
 end
 
 #--------------------------------------
 #    終了処理
 #--------------------------------------
 def finish
   # 表示物があれば削除
   delete_items
   # GUI システム終了
   stop_gui
   # プログラムの終了
   exit
 end
 
 #======================================
 #    実際の処理はここからスタート
 #======================================
 init # 初期化処理
 mainloop ScenarioTbl # メインループ
