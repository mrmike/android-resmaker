#!/usr/bin/env ruby

require 'rubygems'
require 'rmagick'
require 'fileutils'

def include_file?
    params = ARGV.length > 0
    params && File.exist?(ARGV[0])
end

def xxhdpi?
    params = ARGV.length == 2
    params && ARGV[1] == '--xxhdpi'
end

def save(name, img, dpi)
    dirname = File.dirname("res/drawable-#{dpi}/#{name}")
    unless File.directory?(dirname)
        FileUtils.mkdir_p(dirname)
    end

    img.write("res/drawable-#{dpi}/#{name}")
end

abort("You must provide correct file. e.g. resmaker.rb image.jpg") unless include_file?

file_name = ARGV[0]
img = Magick::Image::read(file_name)[0]

if (xxhdpi?)
    save(file_name, img, "xxhdpi")
    xhdpi = img.scale(2.0/3.0)
    save(file_name, xhdpi, "xhdpi")
else
    save(file_name, img, "xhdpi")
end

# creates hdpi and mdpi images
divider = xxhdpi? ? 3 : 2
hdpi = img.scale(1.5/divider)
mdpi = img.scale(1.0/divider)
save(file_name, hdpi, "hdpi")
save(file_name, mdpi, "mdpi")
