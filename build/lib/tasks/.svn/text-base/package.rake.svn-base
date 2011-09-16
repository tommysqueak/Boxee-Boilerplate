require './lib/versioning'
require './lib/preparation'
require './lib/config'
require './lib/packager'
require 'FileUtils'

@packaging_dir = './packaging'
@packages_dir = './packages'
@version = '1.0'

desc "package the app into zip files for each specified environment"
task :package => :prepare  do
  
  zipper = Zipper.new(@packaging_dir, @packages_dir)
  packager = Packager.new(@packaging_dir, zipper)
  
  GreatBoxee::Config.environments.each do |env|
    packager.package env, @version
  end
  
end

desc "prepare app files for packaging"
task :prepare do
  
  FileUtils.rm_rf @packaging_dir if Dir.exists?(@packaging_dir)
  
  Preparation.copy_valid_files './../', @packaging_dir
  
  @version = Versioning.next_version
end