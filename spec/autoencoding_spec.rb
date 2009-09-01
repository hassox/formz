
require File.dirname(__FILE__) + '/spec_helper'

describe Formz do
  describe "autoencoding" do
    it "should set the forms enctype properly when a file field is present" do
      markup = form :image_upload do
        file :image
        submit :op, 'Upload'
      end
      markup.should have_tag('form[@enctype="form/multi-part"]')
    end
  end
end
