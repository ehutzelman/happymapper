dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'happymapper')

file_contents = File.read(dir + '/../spec/fixtures/photos.xml')

class Photo
  include HappyMapper

  attribute :id, String
  attribute :size, String
  # parse the value of the current element
  element :url, String, :tag => '.'
end

photos = Photo.parse(file_contents)
photos.each {|photo| puts photo.id, photo.size, photo.url, ''}
