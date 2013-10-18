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
  def initialize
    read_entries
  end

  def generate
    @entries = @all_entries
    rhtml = File.read('views/list.html.erb')
    html = ERB.new(rhtml).result(binding)
    File.open('html/index.html', 'w') {|f| f.write(html) }
  end

  def read_entries
    @all_entries = []
    Dir.glob('data/*.txt').each do |filename|
      if File.basename(filename) =~ /\A\d{4}-\d{2}-\d{2}/
        @all_entries << Entry.new(filename)
      end
    end
  end
end

Blog.new.generate
