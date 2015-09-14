class Article < ActiveRecord::Base

attr_accessor :hero_image
  def self.save(hero_image)
    name = upload['hero_image'].original_filename
    directory = 'public/data'
    # create the file path
    path = File.join(directory,name)
    # write the file
    File.open(path, "wp") { |f| f.write(upload['hero_image'].read)}
  end
  
  attr_accessor :optional_image
  def self.save(optional_image)
    name = upload['optional_image'].original_filename
    directory = 'public/data'
    # create the file path
    path = File.join(directory,name)
    # write the file
    File.open(path, "wp") { |f| f.write(upload['optional_image'].read)}
  end
  
end
