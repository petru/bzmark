# encoding: UTF-8
require 'rmagick'
class Bzmark

  # paths
  @@templates = "assets/templates/"
  @@input = "input/"
  @@output = "output/"  
  
  # draw settings
  @@font = "assets/fonts/opensans/OpenSans-Semibold.ttf"
  @@pointsize = 14
  @@fill = "#202530"
  
  
  def initialize(file)
    
    filename = file.split(".")
    data = filename[0,filename.length-1].join(".").split("^")
    
    @file = file
    @template = data[0]
    @line1 = data[1]
    @line2 = data[2]
    
  end
  
  def template
    return @@templates + @template + ".png"
  end
  
  def dump
    @source.write(@@output + @template + @line1 + ".png")
  end
  
  
  def add_belt
    mark = Magick::Image.read(template).first
    @source = @source.composite(mark,0,0,Magick::OverCompositeOp)
  end
  
  def add_text
    caption = Magick::Draw.new
    
    caption.annotate(@source, 382, 27, 110, 278, @line1) do
      caption.font = @@font
      caption.pointsize = @@pointsize
      caption.fill = @@fill
      caption.stroke = "none"
    end
    
    if @line2 
      caption.annotate(@source, 382, 27, 110, 298, @line2) do
        caption.font = @@font
        caption.pointsize = @@pointsize
        caption.fill = @@fill
        caption.stroke = "none"
      end
    end
  end
  
  def process
    @source = Magick::Image.read(@@input + @file).first
    @source.resize_to_fill!(532,356,Magick::CenterGravity)
    add_belt
    add_text
    dump
  end
end