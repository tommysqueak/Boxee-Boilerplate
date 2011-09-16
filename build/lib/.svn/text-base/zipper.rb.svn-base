require 'rubygems'
require 'zip/zip'
require 'find'
require 'FileUtils'

class Zipper
  
  def initialize(packaging_dir, packages_dir)
    @packaging_dir = packaging_dir
    @packages_dir = packages_dir
  end
  
  def file_name(app_id, version)
    "#{app_id}-#{version}.zip"
  end
  
  def zip(app_id, version)

    FileUtils.mkdir(@packages_dir) unless Dir.exists?(@packages_dir)
    new_zip_file = File.join @packages_dir, file_name(app_id, version)

    Zip::ZipFile.open(new_zip_file, Zip::ZipFile::CREATE) do |zipfile|

      Find.find(@packaging_dir) do |path|
        Find.prune if File.basename(path)[0] == ?.

        dest_match = /#{@packaging_dir}\/(\w.*)/.match(path)
      
        if dest_match
          dest = "#{app_id}/#{dest_match[1]}"
          puts "zipping: #{dest}"
          zipfile.add(dest, path) 
        end
      end
      
      zipfile.close
    end
    
  end
end