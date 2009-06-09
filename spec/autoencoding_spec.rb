
describe Formz do
  describe "autoencoding" do
    it "should set the forms enctype properly when a file field is present" do
      markup = form :image_upload do
        file :image
      end
      markup.should have_tag('form[@enctype="form/multi-part"]')
    end
  end
end
