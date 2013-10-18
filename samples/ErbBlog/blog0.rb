#!ruby -Ku
require 'erb'
require 'date'

class Entry
  def initialize(filename)
    @filename = filename
    @body = File.read(@filename)
  end

  def date
    Date.parse(File.basename(@filename, '.txt'))
  end

  def to_html
    @body
  end
end

class Blog
  def generate
    @entries = []
    @entries << Entry.new('data/2007-04-01.txt')
    @entries << Entry.new('data/2007-04-02.txt')
    @entries << Entry.new('data/2007-04-21.txt')

    rhtml = File.read('views/list.html.erb')
    html = ERB.new(rhtml).result(binding)
    File.open('html/index.html', 'w') {|f| f.write(html) }
  end
end

Blog.new.generate
