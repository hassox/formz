
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'rubygems'
require 'formz/import'

result = form :register, :action => '/register' do
  fieldset :login, 'Login Information' do
    text :username, :label => 'Username'
    password :password, :label => 'Password'
    password :password_confirm, :required => true, :description => 'Enter password between 6 - 30 characters.'
  end
  fieldset :account, 'Account Details' do
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
puts result