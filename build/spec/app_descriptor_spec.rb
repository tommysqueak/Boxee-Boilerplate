require 'rspec'
require 'FileUtils'
require './lib/app_descriptor'

describe AppDescriptor, "reading, writing and generating app descriptor files" do
  
  describe "reading the xml descriptor file" do
    
    before do
      @descriptor = AppDescriptor.from_xml './spec/assets/descriptor.xml'
    end
    
    it "should load the values from the file into AppDescriptor " do
      @descriptor['id'].should == 'GreatBoxee.RakeTest'
      @descriptor['name'].should == 'Rake Test'
    end

  end
  
  describe "writing to the descriptor file" do
    
    before do
      @test_file = './spec/write_read.xml'
      FileUtils.rm @test_file if File.exists?(@test_file)
      @descriptor = AppDescriptor.from_xml './spec/assets/descriptor.xml'
    end
    
    it "should write the values in AppDescriptor to the descriptor file" do
      
      @descriptor.to_xml @test_file
      @written_descriptor = AppDescriptor.from_xml @test_file

      @written_descriptor['id'].should == 'GreatBoxee.RakeTest'
      @written_descriptor['name'].should == 'Rake Test'
    end

    after do
      FileUtils.rm @test_file if File.exists?(@test_file)
    end

  end
  
  describe "creating a descriptor file suitable for packaging and hence deployment" do
    
    before do
    
      @descriptor = AppDescriptor.new
      @descriptor['id'] = 'rake.test'
      @descriptor['test-app'] = 'true'
      
      extras = {'id' => "rake.pass", 'name' => 'tommy'}
    
      @descriptor_for_deployment = @descriptor.copy_for_deployment(extras, '2.0') 
          
    end

    it "should not modify the original " do
      @descriptor['test-app'].should eql 'true'
    end

    it "should not include the test-app tag" do
      @descriptor_for_deployment['test-app'].should be nil
    end
    
    it "should add any new descriptions" do
      @descriptor_for_deployment['name'].should eql 'tommy'
    end
    
    it "should overwrite any existing descriptions" do
      @descriptor_for_deployment['id'].should eql 'rake.pass'
    end
    
    it "should add the version" do
      @descriptor_for_deployment['version'].should eql '2.0'
    end
  end
  
end