
require File.dirname(__FILE__) + '/spec_helper'

describe Formz do
  describe "labels" do
    it "should add a label element" do
      tag(:textarea, :name => 'comments', :label => 'Comments').
      should have_tag('label[@for=comments]', 'Comments:')
    end
    
    it "should allow an element to be required" do
      tag(:textarea, :name => 'comments', :label => 'Comments', :required => true).
      should have_tag('label[@for=comments]', 'Comments*:') do |label|
        label.should have_tag('em', '*')
      end
    end
  end
end
