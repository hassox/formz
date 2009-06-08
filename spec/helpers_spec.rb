
describe Formz do
  describe "helpers" do
    describe "#select" do
      it "should create a select element with options" do
        markup = select :province, :ab => 'Alberta', :bc => 'British Columbia'
        markup.should have_tag('select') do |select|
          select.should have_tag('option[@value=ab]', 'Alberta')
          select.should have_tag('option[@value=bc]', 'British Columbia')
        end
      end
      
      it "should create a select with optgroups" do
        options = {}
        options['Canada'] = { :ab => 'Alberta', :bc => 'British Columbia' }
        options['United States'] = { :oh => 'Ohio' }
        options[:other] = 'Other'
        markup = select :province, options, :selected => :ab
        markup.should have_tag('select') do |select|
          select.should have_tag('optgroup[@label=Canada]') do |group|
            group.should have_tag('option[@value=ab]', 'Alberta') do |option|
              option['selected'].should == 'selected'
            end
            group.should have_tag('option[@value=bc]', 'British Columbia')
          end
          select.should have_tag('optgroup[@label="United States"]') do |group|
            group.should have_tag('option[@value=oh]', 'Ohio')
          end
          select.should have_tag('option[@value=other]', 'Other')
        end
      end
      
      it "should allow a null prompt with a default" do
        markup = select :vehicle, { :nissan => 'Nissan' }, :prompt => true
        markup.should have_tag('option[@value=""]', '- Select -')
      end
      
      it "should allow an arbitrary prompt" do
        markup = select :vehicle, { :nissan => 'Nissan' }, :prompt => 'Please Select'
        markup.should have_tag('option[@value=""]', 'Please Select')
      end
      
      it "should allow selections by value" do
        markup = select :province, { :ab => 'Alberta', :bc => 'British Columbia' }, :selected => :bc, :prompt => true
        markup.should have_tag('option[@value=bc]') do |option|
          option['selected'].should == 'selected'
        end
      end
      
      it "should allow multiple selections" do
        options = { :nissan => 'Nissan', :acura => 'Acura', :ford => 'Sucks' }
        markup = select :vehicle, options, :selected => [:nissan, :acura]
        markup.should have_tag('option[@value=nissan]') do |option|
          option['selected'].should == 'selected'
        end
        markup.should have_tag('option[@value=acura]') do |option|
          option['selected'].should == 'selected'
        end
      end
    end
    
    describe "#form" do
      it "should add a form-ID" do
        form(:login).should have_tag('form[@id=form-login]')
      end
    end
    
    describe "#fieldset" do
      it "should should add a legend when string passed as second arg" do
        markup = fieldset :details, 'Account Details'
        markup.should have_tag('fieldset[@id=fieldset-details]') do |fieldset|
          fieldset.should have_tag('legend', 'Account Details')
        end
      end
      
      it "should allow hash of attributes, without legend" do
        markup = fieldset :details, :id => :foo
        markup.should have_tag('fieldset[@id=foo]') do |fieldset|
          fieldset.should_not have_tag('legend')
        end        
      end
    end
    
    describe "#buttons" do
      it "should wrap in a buttons div" do
        buttons(:id => 'login-buttons').should have_tag('div[@id=login-buttons]') do |div|
          div['class'].should == 'form-buttons'
        end
      end
    end
  end
end
