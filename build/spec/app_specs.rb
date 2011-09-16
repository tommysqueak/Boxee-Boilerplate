require 'rspec'
require './lib/app'

describe App, "describing the app for the different deployment environments" do
  
  describe "loading descriptor files for specific environments" do
    
    describe "explicity defined in an enironment specific descriptor file" do
      
      before do
        App.should_receive(:get_file).with(:beta).and_return('./spec/assets/descriptor.beta.xml')        
      end
      
      it "should load the defined environment values" do
        descriptor = App.get_description :beta
        descriptor['id'].should == "GreatBoxeeBeta.RakeTest"
      end
    end
    
    describe "not defined in an environment specific file" do
      
      before do
        App.should_receive(:get_file).with(:beta).and_return('./spec/I_am_not_here.xml')
        App.should_receive(:get_file).with(:default).and_return('./spec/assets/descriptor.xml')    
      end
      
      it "should load the default values" do
        descriptor = App.get_description :beta
        descriptor['id'].should == "GreatBoxee.RakeTest"
      end
    end
  end
  
end