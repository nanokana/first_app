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
    write_html('index', 'list')
  end

  def read_entries
    @all_entries = []
    Dir.glob('data/*.txt').each do |filename|
      if File.basename(filename) =~ /\A\d{4}-\d{2}-\d{2}/
        @all_entries << Entry.new(filename)
      end
    end
  end

  def write_html(name, template = name)
    filename = "html/#{name}.html"
    puts "      create #{filename}"
    @content = render_view(template)
    html = render_view('layout')
    File.open(filename, 'w') {|f| f.write(html) }
  end

  def render_view(template)
    rhtml = File.read("views/#{template}.html.erb")
    ERB.new(rhtml).result(binding)
  end
end

Blog.new.generate
