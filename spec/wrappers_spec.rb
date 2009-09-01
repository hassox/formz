
require File.dirname(__FILE__) + '/spec_helper'

describe Formz do
  describe "wrappers" do
    before :each do
      @markup = tag :input, :type => :file, :name => :upload
    end
    
    it "should wrap a field in a div for styling" do
      @markup.should have_tag('div') do |div|
        div.should have_tag('input')
      end
    end
    
    it "should add classes for the type of field and its name" do
      @markup.should have_tag('div.field-upload.field-file')
    end
  end
end
