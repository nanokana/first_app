#!ruby -Ku
require 'blog'

config = {
  :title => 'Diary.ノブナガ 〜天下統一できるかな〜',
  :data_path => 'data',    # 原稿が置いてあるディレクトリ
  :html_path => 'html',    # htmlファイルを出力するディレクトリ
  :latest_limit => 5,      # トップページで表示する日記の件数
}
Blog.new(config).generate
