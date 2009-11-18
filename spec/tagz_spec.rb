
describe Tagz do
  describe "#tag" do
    it "should return a simple tag when only a tag name is passed" do
      tag(:div).should have_tag(:div)
    end
    
    it "should self-close appropriate tags automatically" do
      tag(:br).should include('<br/>')
    end
    
    it "should allow a hash of attributes to be passed" do
      tag(:input, :type => :text).should have_tag('input[@type=text]')
    end
    
    it "should allow contents to be passed" do
      tag(:textarea, 'hello', :id => 'comments').should have_tag('textarea[@id=comments]', 'hello')
    end
    
    it "should mirror boolean attributes" do
      tag(:input, :type => :checkbox, :checked => true).should have_tag('input[@checked=checked]')
      tag(:input, :type => :checkbox, :checked => false).should_not have_tag('input[@checked=checked]')
    end
    
    it "should accept blocks to populate contents" do
      markup = tag :form do |div|
        div.tag :h2, 'Login'
        div.tag :input, :type => :text
        div.tag :input, :type => :submit, :value => 'Submit'
      end
      markup.should have_tag('form') do |form|
        form.should have_tag('h2', 'Login')
        form.should have_tag('input[@type=text]')
        form.should have_tag('input[@type=submit]')
      end
    end
    
    it "should evaluate blocks to populate contents" do
      markup = tag :form do
        tag :h2, 'Login'
        tag :input, :type => :text
        tag :input, :type => :submit, :value => 'Submit'
      end
      markup.should have_tag('form') do |form|
        form.should have_tag('h2', 'Login')
        form.should have_tag('input[@type=text]')
        form.should have_tag('input[@type=submit]')
      end
    end
    
    it "should work with deep nesting" do
      markup = tag :form do |div|
        div.tag :h2, 'Comment'
        div.tag :div do |div|
          div.tag :textarea, :id => 'comments'
          div.tag :input, :type => 'submit'
        end
      end
      markup.should have_tag('form') do |form|
        form.should have_tag('h2', 'Comment')
        form.should have_tag('div') do |div|
          div.should have_tag('textarea[@id=comments]')
          div.should have_tag('input[@type=submit]')
        end
      end
    end
    
    it "should work with deep nesting when evaluating blocks" do
      markup = tag :form do
        tag :h2, 'Comment'
        tag :div do
          tag :textarea, :id => 'comments'
          tag :input, :type => 'submit'
        end
      end
      markup.should have_tag('form') do |form|
        form.should have_tag('h2', 'Comment')
        form.should have_tag('div') do |div|
          div.should have_tag('textarea[@id=comments]')
          div.should have_tag('input[@type=submit]')
        end
      end
    end
    
  end
end