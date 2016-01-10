# encoding: UTF-8
require './bzmark'
files = Dir.entries("input/").select {|f| !File.directory? f}
files.each { |file|
    img = Bzmark.new(file)
    img.process
    puts "Processing #{file}..."
}
puts "Done."