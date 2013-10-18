#!ruby -Ku
require 'erb'
require 'date'
require 'hikidoc'

class Entry
  def initialize(filename)
    @filename = filename
    @body = File.read(@filename)
  end

  def date
    Date.parse(File.basename(@filename, '.txt'))
  end

  def to_html
    HikiDoc.to_html(@body, :level => 2)
  end
end

class Blog
  def initialize
    read_entries
  end

  def generate
    generate_top
    generate_about
    generate_monthly
  end

  def generate_top
    @entries = latest_entries(5)
    write_html('index', 'list')
  end

  def generate_about
    @entry = Entry.new('data/about.txt')
    write_html('about')
  end

  def generate_monthly
    @all_entries.each do |year_month, entries|
      @entries = entries
      write_html(year_month, 'list')
    end
  end

  def latest_entries(n)
    @all_entries.values.flatten.sort_by {|e| e.date }.reverse.first(n)
  end

  def read_entries
    @all_entries = {}
    Dir.glob('data/*.txt').sort.reverse.each do |filename|
      if key = File.basename(filename)[/\A\d{4}-\d{2}/]
        @all_entries[key] ||= []
        @all_entries[key] << Entry.new(filename)
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
