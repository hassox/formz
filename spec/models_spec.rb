
describe Formz do
  describe "models" do
    before :each do
      @user = Factory.build :user
    end
    
    describe "#form_for" do
      it "should create a form in context to a model, populating fields" do
        markup = form_for @user do
          hidden :id
          text :name
          text :email
          textarea :signature
        end
        markup.should have_tag('input[@name=user[id]]') do |id|
          name['value'].should == '1'
        end
        markup.should have_tag('input[@name=user[name]]') do |name|
          name['value'].should == 'tjholowaychuk'
        end
        markup.should have_tag('input[@name=user[email]]') do |email|
          name['value'].should == 'tj@vision-media.ca'
        end
        markup.should have_tag('textarea[@name=user[signature]]', 'Foo bar')
        markup.should_not have_tag('input[@name=_method[user]]')
      end
      
      it "should override defaults when a value is present" do
        markup = form_for @user do
          text :name, :default => 'foo'
        end
        markup.should have_tag('input[@value=tjholowaychuk]')
      end

      it "should default values with :default" do
        @user = Factory.build :user, :name => ''
        markup = form_for @user do
          text :name, :default => 'foo'
        end
        markup.should have_tag('input[@value=foo]')
      end
            
      it "should give precedence to :value" do
        markup = form_for @user do
          text :name, :value => 'foo'
        end
        markup.should have_tag('input[@value=foo]')
      end
      
      it "should populate using values in #params" do
        
      end
    end
  end
end
