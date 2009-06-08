
describe Formz do
  describe "descriptions" do
    it "should add descriptions to a field" do
      text(:name, :description => 'Enter your firstname.').
      should have_tag('span.description', 'Enter your firstname.')
    end
  end
end
