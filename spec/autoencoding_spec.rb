
describe Formz do
  describe "autoencoding" do
    it "should set the forms enctype properly when a file field is present" do
      text(:name, :description => 'Enter your firstname.').
      should have_tag('span.description', 'Enter your firstname.')
    end
  end
end
