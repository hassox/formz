
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
  end
end
