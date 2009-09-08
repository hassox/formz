
require File.dirname(__FILE__) + '/spec_helper'

describe Formz do
  describe "models" do
    before :each do
      @user = Factory.build :user
    end
    
    describe "#form_for" do
      it "should create a form in context to a model, populating fields" do
        markup = form_for @user do
          hidden :id
          text :name
          text :email
          textarea :signature
        end
        markup.should have_tag('input[@name=user[id]]') do |id|
          name['value'].should == '1'
        end
        markup.should have_tag('input[@name=user[name]]') do |name|
          name['value'].should == 'tjholowaychuk'
        end
        markup.should have_tag('input[@name=user[email]]') do |email|
          name['value'].should == 'tj@vision-media.ca'
        end
        markup.should have_tag('textarea[@name=user[signature]]', 'Foo bar')
        markup.should_not have_tag('input[@name=user[_method]]')
      end
      
      it "should default selected options to the model's property" do
        markup = form_for @user do
          select :role, :admin => 'Admin', :manager => 'Manager'
        end
        markup.should have_tag('select[@name=user[role]]') do |role|
          role.should have_tag('option[@value=admin]') do |admin|
            admin['selected'].should == 'selected'
          end
          role.should have_tag('option[@value=manager]') do |manager|
            manager['selected'].should_not == 'selected'
          end
        end
      end
      
      it "should default selected options to the form defaults" do
        markup = form_for @user do
          select :role, :admin => 'Admin', :manager => 'Manager', :selected => :manager
        end
        markup.should have_tag('select[@name=user[role]]') do |role|
          role.should have_tag('option[@value=admin]') do |admin|
            admin['selected'].should_not == 'selected'
          end
          role.should have_tag('option[@value=manager]') do |manager|
            manager['selected'].should == 'selected'
          end
        end
      end
      
      it "should override defaults when a value is present" do
        markup = form_for @user do
          text :name, :default => 'foo'
        end
        markup.should have_tag('input[@value=tjholowaychuk]')
      end
      
      it "should create an instance when using a symbol" do
        markup = form_for :user do
          text :name, :default => 'foo'
        end
        markup.should have_tag('input[@value=foo]')
        
      end
      
      it "should allow model defaults" do
        markup = form_for :user do
          textarea :signature
        end
        markup.should have_tag('textarea', 'Enter your forum signature')
      end
      
       it "should create an instance when using a class" do
          markup = form_for User do
            text :name, :default => 'foo'
          end
          markup.should have_tag('input[@value=foo]')
        end
    end
    
  end
end
