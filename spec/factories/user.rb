
class User
  include DataMapper::Resource
  property :id,    Serial
  property :name,  String, :length => 5..20
  property :email, String, :format => :email_address
  property :role,  String
end

Factory.define :user do |user|
  user.id = 1
  user.name = 'tjholowaychuk'
  user.email = 'tj@vision-media.ca'
  user.role = 'admin'
end