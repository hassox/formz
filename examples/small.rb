
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'rubygems'
require 'formz'
require 'tagz/import'
include Formz::Helpers

markup = form :login do
  fieldset :details, 'Details' do
    text :username
    password :password
  end
  fieldset :details, 'Details' do
    text :username
    password :password
  end
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
    submit :op, 'Join', :value => :join
    submit :op, 'Cancel', :value => :cancel
  end
end
puts markup