require 'find'
require 'FileUtils'

class Preparation
  def self.copy_valid_files(from, to)
  
    ensure_destination(to)
  
    Dir.foreach(from) do |file|
      
        next if exclude?(file)

        s = File.join(from, file)
        d = File.join(to, file)

        #puts "copying: #{d}"

        if File.directory?(s)
          copy_valid_files s, d
        else File.file?(s)
          FileUtils.cp(s, d)
        end
        
    end
  end
  
  private
  
    @exclude = ["^\\.", "build", "descriptor.*\.xml", "spec", "nbproject", ".*\.xcf", ".*\.psd", ".*\.project", ".*\.pydevproject"]
    
    def self.exclude?(file)
      
      @exclude.each do |s|
        if file.match(/#{s}/i)
          return true
        end
      end
      false
    end
      
    def self.ensure_destination(dest)
      FileUtils.mkdir(dest) unless Dir.exists?(dest)
    end
end