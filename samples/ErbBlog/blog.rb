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

  def head
    @body[/.*$/].sub(/\A!/, '')
  end
end

class Blog
  def initialize(conf = {})
    @title = conf[:title] || 'ERBBlog'
    @data_path = conf[:data_path] || 'data'
    @view_path = conf[:view_path] || 'views'
    @html_path = conf[:html_path] || 'html'
    @latest_limit = conf[:latest_limit] || 5
    read_entries
  end

  def generate
    generate_top
    generate_about
    generate_monthly
    generate_archives
  end

  def generate_top
    @entries = latest_entries(@latest_limit)
    write_html('index', 'list')
  end

  def generate_about
    @entry = Entry.new("#{@data_path}/about.txt")
    write_html('about')
  end

  def generate_archives
    write_html('archives')
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
    Dir.glob("#{@data_path}/*.txt").sort.reverse.each do |filename|
      if key = File.basename(filename)[/\A\d{4}-\d{2}/]
        @all_entries[key] ||= []
        @all_entries[key] << Entry.new(filename)
      end
    end
  end

  def write_html(name, template = name)
    filename = "#{@html_path}/#{name}.html"
    puts "      create #{filename}"
    @content = render_view(template)
    html = render_view('layout')
    File.open(filename, 'w') {|f| f.write(html) }
  end

  def render_view(template)
    rhtml = File.read("#{@view_path}/#{template}.html.erb")
    ERB.new(rhtml).result(binding)
  end
end
