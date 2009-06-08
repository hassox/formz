
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
    end
  end
end
