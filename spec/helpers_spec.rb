
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
      
      it "should create nested optgroups" do
        options = {}
        options['Canada'] = { :ab => 'Alberta', :bc => 'British Columbia' }
        options['United States'] = { :oh => 'Ohio' }
        options[:other] = 'Other'
        markup = select :province, options
        markup.should have_tag('select') do |select|
          select.should have_tag('optgroup[@label=Canada]') do |group|
            group.should have_tag('option[@value=ab]', 'Alberta')
            group.should have_tag('option[@value=bc]', 'British Columbia')
          end
          select.should have_tag('optgroup[@label="United States"]') do |group|
            group.should have_tag('option[@value=oh]', 'Ohio')
          end
          select.should have_tag('option[@value=other]', 'Other')
        end
      end
    end
  end
end
