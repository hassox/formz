
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'rubygems'
require 'formz/import'

markup = form :login do
  text :username
end
puts markup

__END__

markup = form :register, :action => '/register' do
  fieldset :login, 'Login Information' do
    text :username, :label => 'Username'
    password :password, :label => 'Password'
    password :password_confirm, :required => true, :description => 'Enter password between 6 - 30 characters.'
  end
  fieldset :account, 'Account Details' do
    select :sex, :male => 'Male', :female => 'Female', :label => 'Sex'
    text :country, :label => 'Country'
    text :city, :label => 'City'
    fieldset :forum, 'Forum Related' do
      file :image, :label => 'Avatar'
      textarea :signature, :label => 'Signature'
    end
  end
  buttons do
    submit :op, 'Join'
    submit :cancel, 'Cancel'
  end
end
puts markup