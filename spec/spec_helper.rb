
$:.unshift File.dirname(__FILE__) + '/../lib' 
$:.unshift '/Users/tjholowaychuk/scripts/gems/tags/lib'
require 'rubygems'
require 'dm-core'
require 'dm-validations'
require 'factory_girl'
require 'tagz/import'
require 'formz/import'
require 'rspec_hpricot_matchers'

Spec::Runner.configure do |config|
  config.include RspecHpricotMatchers
end