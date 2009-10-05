
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'rubygems'
require 'dm-core'
require 'factory_girl'
require 'formz/import'
require 'tagz/import'

class User
  include DataMapper::Resource
  property :uid,   Serial    
  property :name,  String,   :length => 5..20
  property :email, String,   :format => :email_address
  property :role,  String
  property :signature, Text, :default => 'Enter your forum signature'
end

Factory.define :user do |user|
  user.uid 1
  user.name 'tjholowaychuk'
  user.email 'tj@vision-media.ca'
  user.role 'admin'
  user.signature 'Foo bar'
end

puts "\nAnonymous"
markup = form_for :user do
  hidden :uid
  text :name, :label => 'Username', :required => true
  text :email, :default => 'example@site.com'
  textarea :signature
  select :role, :admin => 'Admin', :manager => 'Manager'
end
puts markup

puts "\nPopulated Model"
markup = form_for Factory.build(:user), :method => :put do
  hidden :uid
  text :name, :label => 'Username', :required => true
  text :email, :default => 'example@site.com'
  textarea :signature
  select :role, :admin => 'Admin', :manager => 'Manager'
end
puts markup
