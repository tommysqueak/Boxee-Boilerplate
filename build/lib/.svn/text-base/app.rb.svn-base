require 'rexml/document'
include REXML
require './lib/convention_app_descriptor'

class App
  
  def self.get_description(env)
    
    descriptor_file = get_file env
    
    if File.exists? descriptor_file
      return AppDescriptor.from_xml descriptor_file
    else
      return ConventionAppDescriptor.from_xml get_file(:default)
    end
    
  end
  
  private 
    def self.get_file(env)
      if env == :default
        return "./../descriptor.xml"
      else
        return "./../descriptor.#{env}.xml"
      end
    end
end