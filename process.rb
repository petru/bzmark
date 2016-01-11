# encoding: UTF-8
require './bzmark'
files = Dir.entries("input/",{encoding: "utf-8"}).select {|f| !File.directory? f}
files.each { |file|
  next if file == "Thumbs.db"
  img = Bzmark.new(file)
  img.process
  puts "Processing #{file}..."
}
puts "Done. Press ENTER to exit."
gets