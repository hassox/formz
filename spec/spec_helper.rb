
require 'rubygems'
require 'formz/import'
require 'rspec_hpricot_matchers'

Spec::Runner.configure do |config|
  config.include RspecHpricotMatchers
end