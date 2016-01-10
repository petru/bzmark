# encoding: UTF-8
require 'rmagick'
def add_belt(file)
  img = Magick::Image.read(file).first
  mark = Magick::Image.read("assets/belt.png").first
  
  img2 = img.composite(mark,0,0,Magick::OverCompositeOp)
  img2.write("output/ake.png")
end

def add_text(line1, line2)
  img = Magick::Image.read("output/ake.png").first
  draw = Magick::Draw.new
  
  draw.annotate(img, 382, 27, 110, 258, "Tragedie în a doua zi de Crăciun") do
    draw.font = "assets/fonts/opensans/OpenSans-Semibold.ttf"
    draw.pointsize = 14
    draw.fill = "#202530"
    draw.stroke = "none"
  end
  
  draw.annotate(img, 382, 27, 110, 278, "Bătrână decedată în urma intoxicației cu fum") do
    draw.font = "assets/fonts/opensans/OpenSans-Semibold.ttf"
    draw.pointsize = 14
    draw.fill = "#202530"
    draw.stroke = "none"
  end
  img.write("output/ake2.png")
end
#add_belt("input/amb.jpg")
add_text("asda","asdasd")