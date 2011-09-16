require './lib/app'
require './lib/app_descriptor'
require './lib/zipper'

class Packager
  
  def initialize(packaging_dir, zipper)
    @packaging_dir = packaging_dir
    @zipper = zipper
  end
  
  def package(env_config, version)

    env = env_config.first
    puts "packaging for '#{env}'"
    
    descriptor = App.get_description env
    descriptor.generate_descriptor_file env_config[1], version, @packaging_dir
    
    @zipper.zip descriptor['id'], version
    
  end
end
