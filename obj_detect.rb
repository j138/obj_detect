#!/usr/bin/env ruby

require 'opencv'
include OpenCV

if ARGV.size != 1
  puts 'Usage: ruby #{__FILE__} Image'
  img = './img/test.jpg'
else 
  img = ARGV[0]
end

img = IplImage.load(img)

faces = OpenCV::CvHaarClassifierCascade.load './cascade.xml'

faces.detect_objects(img.to_CvMat) { |rect|
  img.rectangle!(rect.top_left, rect.bottom_right, :color => CvColor::Red)
}

window = GUI::Window.new('detect face')
window.show(img)
GUI::wait_key
