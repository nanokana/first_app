text = File.read('file1.txt')                      # ファイルを読み込む
File.open('file2.txt', 'w') {|f| f.write text }    # ファイルへ書き出す
