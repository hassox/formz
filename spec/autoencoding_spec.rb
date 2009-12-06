
require File.dirname(__FILE__) + '/spec_helper'

describe Formz do
  describe "autoencoding" do
    it "should set the forms enctype properly when a file field is present" do
      markup = formz.form :image_upload do
        file :image
        submit :op, 'Upload'
      end
      markup.should have_tag('form[@enctype="multipart/form-data"]')
    end
  end
end
