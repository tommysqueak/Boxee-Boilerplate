require 'rexml/document'
include REXML
require 'xmlsimple'
require 'FileUtils'

class AppDescriptor < Hash
  
  def generate_descriptor_file(descriptor_additions, version, destination)
    
    merge! descriptor_additions
    self['version'] = version
    delete 'test-app'
    
    to_xml File.join(destination, 'descriptor.xml')
  end
  
  def to_xml(xml_file)
    xml = XmlSimple.xml_out(Hash[self], {'NoAttr' => true, 'RootName' => 'app', 'OutputFile' => xml_file})
  end
  
  def self.from_xml(xml_file)
    
    descriptor = new
    descriptor.replace XmlSimple.xml_in(xml_file, 'ForceArray' => false)    
    return descriptor
    
  end
  
end