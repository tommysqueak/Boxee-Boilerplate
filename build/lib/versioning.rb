require 'FileUtils'

class Versioning
  def self.next_version()
    
    if File.exists? tracking_file
      version = current_version
      puts "previous version: #{version}"
      next_version = increment_version version
    else
      puts "first version"
      next_version = '1.0'
    end
    
    puts "version: #{next_version}"
    
    save_version next_version
    
    return next_version
    
  end
  
  def self.increment_version(version)
    minor = version.scan(/[0-9]*\.(.*)/).first.first
    version.gsub(/\.(.*)/, '.' + (minor.to_i + 1).to_s)
  end
  
  private
  
    def self.current_version
      File.open(tracking_file, &:readline)
    end
  
    def self.save_version(version)
      File.open(tracking_file, 'w') {|f| f.write(version) }
    end
  
    def self.tracking_file()
      './version.number'
    end
end