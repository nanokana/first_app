$KCODE = "S"
LOOP_INTERVAL = 100

require "tk"

class String
  def jfold(len)
    raise ArgumentError if len <= 0
    ary = nil
    right = self.delete("\r\n")
    while right and not right.empty?
      left, right = right.unpack("a#{len} a*")
      if /.\z/ !~ left
          right[0,0] = left[-1,1]
          left[-1,1] = ''
      end
      if block_given?
        yield left
      else
        ary ||= []
        ary.push left
      end
    end
    ary
  end
end

class Font
  attr_reader :tkc_text
  def initialize canvas, str, x, y, size, color
    f = TkFont.new("Times #{size}")
    @tkc_text_s = TkcText.new(canvas,x+1,y+1) do
      fill("#000000")
      anchor('nw')
      font f
    end
    @tkc_text = TkcText.new(canvas,x,y) do
      fill("##{color}")
      anchor('nw')
      font f
    end
    @tkc_text_s.text(str)
    @tkc_text.text(str)
  end
  def color col
    @tkc_text.fill col
  end
  def delete
    $button_id = -1
    @tkc_text_s.delete
    @tkc_text.delete
  end
end

class Image
  attr_reader :tck_image
  attr_reader :img0
  def initialize canvas,x,y,fname
    @img0 = TkPhotoImage.new { file(fname) }
    @tck_image = TkcImage.new(canvas, x, y, "anchor" => 'nw', "image" => @img0)
  end
  def delete
    $button_id = -1
    @img0.delete
    @tck_image.delete
  end
end

def create_screen title, w, h
  @screen_w = w
  @screen_h = h
  @main_window = TkRoot.new do
    title(title)
    resizable(0, 0)
  end
  @main_window.bind("KeyPress-Escape", proc{ @exit_flag=true } )

  @canvas = TkCanvas.new do
    width(w)
    height(h)
    background("#000000")
    pack('fill' => 'both', 'expand' => true)
  end
end

def create_font str, x, y, size=16, len=0, color='ffffff'
  if len > 0
    str = str.jfold(len).join "\r\n"
  end

  font = Font.new @canvas, str, x, y, size, color
  font
end

def create_font_button bid, str, x, y, size=16, len=0, color='cccccc', color2='ffffff'
  font = Font.new @canvas, str, x, y, size, color
  font.tkc_text.bind 'Button', proc { $button_id = bid }
  font.tkc_text.bind 'Enter', proc { font.tkc_text.fill("##{color2}") }
  font.tkc_text.bind 'Leave', proc { font.tkc_text.fill("##{color}") }
  font
end

def create_img x, y, fname0
  image = Image.new @canvas, x, y, fname0
  image
end

def create_img_button bid, x, y, fname0, fname1=nil
  image = Image.new @canvas, x, y, fname0
  image.tck_image.bind 'Button', proc { $button_id = bid }
  if fname1
    img1 = TkPhotoImage.new { file(fname1) }
    image.tck_image.bind 'Enter', proc { image.tck_image.image(img1) }
    image.tck_image.bind 'Leave', proc { image.tck_image.image(image.img0) }
  end
  image
end

def block_mask color = "#000000"
  num_x = 4
  num_y = 6
  size_x = @screen_w/num_x
  size_y = @screen_h/num_y
  num_y.times do |y|
    num_x.times do |x|
      sx = size_x * x
      sy = size_y * y
      ex = size_x * (x+1) - 1
      ey = size_y * (y+1) - 1
      prim = TkcRectangle.new(@canvas, sx,sy,ex,ey,'outline' => color, 'fill' => color)
    end
  end
end

def delete_block_mask
  @mask_prims.each do |prim|
    prim.delete
  end
end

def get_button_id
  while $button_id == -1
    return 0 if @exit_flag
  end
  bid = $button_id
  $button_id = -1
  bid
end

def start_gui(exit_proc=nil)
  $button_id = -1
  @mask_prims = []

  if exit_proc
    Tk.root.protocol(:WM_DELETE_WINDOW, exit_proc)
  else
    Tk.root.protocol(:WM_DELETE_WINDOW){ exit }
  end

  @thread = Thread.start {
    Tk.mainloop
  }
end

def stop_gui
  @main_window.destroy
  @thread.kill
end

