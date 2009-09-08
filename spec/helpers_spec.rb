
require File.dirname(__FILE__) + '/spec_helper'

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
      
      it "should create a select with optgroups" do
        options = {}
        options['Canada'] = { :ab => 'Alberta', :bc => 'British Columbia' }
        options['United States'] = { :oh => 'Ohio' }
        options[:other] = 'Other'
        markup = select :province, options, :selected => :ab
        markup.should have_tag('select') do |select|
          select.should have_tag('optgroup[@label=Canada]') do |group|
            group.should have_tag('option[@value=ab]', 'Alberta') do |option|
              option['selected'].should == 'selected'
            end
            group.should have_tag('option[@value=bc]', 'British Columbia')
          end
          select.should have_tag('optgroup[@label="United States"]') do |group|
            group.should have_tag('option[@value=oh]', 'Ohio')
          end
          select.should have_tag('option[@value=other]', 'Other')
        end
      end
      
      it "should allow a null prompt with a default" do
        markup = select :vehicle, { :nissan => 'Nissan' }, :prompt => true
        markup.should have_tag('option[@value=""]', '- Select -')
      end
      
      it "should allow an arbitrary prompt" do
        markup = select :vehicle, { :nissan => 'Nissan' }, :prompt => 'Please Select'
        markup.should have_tag('option[@value=""]', 'Please Select')
      end
      
      it "should allow selections by value" do
        markup = select :province, { :ab => 'Alberta', :bc => 'British Columbia' }, :selected => :bc, :prompt => true
        markup.should have_tag('option[@value=bc]') do |option|
          option['selected'].should == 'selected'
        end
      end
      
      it "should allow selections of symbols / strings" do
        markup = select :province, { 'ab' => 'Alberta', :bc => 'British Columbia' }, :selected => [:ab, 'bc'], :prompt => true
        markup.should have_tag('option[@value=bc]') do |option|
          option['selected'].should == 'selected'
        end
        markup.should have_tag('option[@value=ab]') do |option|
          option['selected'].should == 'selected'
        end
      end
      
      it "should allow multiple selections" do
        options = { :nissan => 'Nissan', :acura => 'Acura', :ford => 'Sucks' }
        markup = select :vehicle, options, :selected => [:nissan, :acura]
        markup.should have_tag('option[@value=nissan]') do |option|
          option['selected'].should == 'selected'
        end
        markup.should have_tag('option[@value=acura]') do |option|
          option['selected'].should == 'selected'
        end
      end
    end
    
    describe "#form" do
      it "should add a form-ID" do
        form(:login).should have_tag('form[@id=form-login]')
      end
    end
    
    describe "#fieldset" do
      it "should add a legend when string passed as second arg" do
        markup = form :register do
          fieldset :details, 'Account Details'
        end
        markup.should_not have_tag('form > legend')
        markup.should have_tag('fieldset[@id=fieldset-details]') do |fieldset|
          fieldset.should have_tag('legend', 'Account Details')
        end
      end
      
      it "should allow hash of attributes, without legend" do
        markup = fieldset :details, :id => :foo
        markup.should have_tag('fieldset[@id=foo]') do |fieldset|
          fieldset.should_not have_tag('legend')
        end        
      end
    end
    
    describe "#legend" do
      it "should create a legend tag" do
        legend('Details', :id => 'user-details').should have_tag('legend[@id=user-details]', 'Details')
      end
    end
    
    describe "#buttons" do
      it "should wrap in a buttons div" do
        buttons(:id => 'login-buttons').should have_tag('div[@id=login-buttons]') do |div|
          div['class'].should == 'form-buttons'
        end
      end
    end
    
    describe "#group" do
      it "should wrap elements in a div" do
        markup = form :register do
          group :general do
            text :name
            text :email
          end
          group :details do
            text :city
            text :postal_code
          end
        end
        markup.should have_tag('div[@class=group-general]') do |div|
          div.should have_tag('input[@name=name]')
          div.should have_tag('input[@name=email]')
        end
        markup.should have_tag('div[@class=group-details]') do |div|
          div.should have_tag('input[@name=city]')
        end
      end
    end
    
    describe "#radio_group" do
      it "should create a radio button group" do
        markup = radio_group :choice, { :yes => 'Yes', :no => 'No' }, :selected => :no
        markup.should have_tag('input[@name=choice]', :times => 2)
        markup.should have_tag('input[@value=no]') { |radio| radio['selected'].should == 'selected' }
      end
      
      it "should allow multiple selections (though not legal)" do
        markup = radio_group :choice, { :yes => 'Yes', :no => 'No' }, :selected => [:no, :yes]
        markup.should have_tag('input[@value=yes]') { |radio| radio['selected'].should == 'selected' }
        markup.should have_tag('input[@value=no]') { |radio| radio['selected'].should == 'selected' }
      end
    end
  end
end
