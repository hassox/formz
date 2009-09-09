
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

Factory.define :invalid_user, :class => :user do |user|
  user.uid 2
  user.name 'tjholowaychuk'
  user.email 'foobar'
  user.role 'admin'
  user.signature 'Foo bar'
end