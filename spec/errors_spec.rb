
describe Formz do
  describe "errors" do
    before :each do
      @markup = form :login do
        text :username, :label => 'Username'
        password :password, :label => 'Password', :error => 'Invalid Password'
      end
    end
    
    it "should add error classes" do
      @markup.should have_tag('input[@type=password].error')
    end
    
    it "should add error messages after failing fields" do
      @markup.should have_tag('span.error-message', 'Invalid Password')
    end
    
  end
end
