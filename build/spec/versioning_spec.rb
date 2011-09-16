require 'rspec'
require 'FileUtils'
require './lib/versioning'

describe Versioning, "generating the version number" do
  
  describe "incrementing a version" do
    it "should increment the minor version number" do
      Versioning.increment_version('1.12').should == '1.13'
    end
  end
  
  describe "tracking version numbers between builds" do
    
    before :each do
      FileUtils.rm  './spec/i_dont_exist.txt' if File.exists?('./spec/i_dont_exist.txt')
      Versioning.stub!(:tracking_file).and_return('./spec/i_dont_exist.txt')
    end
    
    it "on first run, should generate the starting version number" do
      Versioning.next_version.should == '1.0'
    end
    
    it "should generate incrementing versions" do
      Versioning.next_version
      Versioning.next_version.should == '1.1'
      Versioning.next_version.should == '1.2'
    end
    
    after :each do
      FileUtils.rm  './spec/i_dont_exist.txt' if File.exists?('./spec/i_dont_exist.txt')
    end
    
  end
  
end