
require File.dirname(__FILE__) + '/spec_helper'

describe Formz do
  describe "faux method" do
    it "should add a hidden _method field when verb is not POST or GET" do
      form(:save, :method => :put).should have_tag('form[@method=post]') do |form|
        form.should have_tag('input[@type=hidden]') do |hidden|
          hidden['name'].should == '_method'
          hidden['value'].should == 'put'
        end
      end
    end
    
    it "should not duplicate fields" do
      form(:save, :method => :put).should have_tag('form[@name=_method]', :times => 1)
    end
        
    it "should not add a hidden field when GET or POST" do
      form(:search, :method => :post).should_not have_tag('input[@type=hidden]')
      form(:search, :method => :get).should_not have_tag('input[@type=hidden]')
    end
  end
end
