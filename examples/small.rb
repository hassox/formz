
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

