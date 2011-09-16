require 'rspec'
require 'FileUtils'
require './lib/preparation'

describe Preparation, "copying app files ready for packaging" do
  
  before do
    @sys_files = 2
    @to = './spec/assets/copied/'
    FileUtils.rm_rf @to
    
    Preparation.copy_valid_files './spec/assets/copying', @to   
  end
  
  it "should not copy any invalid files" do
    Dir.new("#{@to}/invalid_files").should have(0 + @sys_files).entries
  end
  
  it "should copy valid files" do
    Dir.new("#{@to}/valid_files").should have(4 + @sys_files).entries
  end
  
  after do
    FileUtils.rm_rf @to
  end
  
end