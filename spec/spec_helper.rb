
$:.unshift File.dirname(__FILE__) + '/../lib'
$:.unshift '/Users/tjholowaychuk/scripts/gems/tags/lib'
require 'rubygems'
require 'dm-core'
require 'dm-validations'
require 'factory_girl'
require 'rspec_hpricot_matchers'
require 'formz'

class FormFactory
  include Tagz           # Must come first always
  include Tagz::Helpers
  include Formz::Helpers # Must come before models
  include Formz::Errors  # Must come before models
  include Formz::Models
  include Formz::Labels
  include Formz::Descriptions
  include Formz::Wrappers
  include Formz::FauxMethod
  
end

module Formz::SpecHelper
  def formz
    FormFactory.new
  end
end

Spec::Runner.configure do |config|
  config.include RspecHpricotMatchers
  config.include Formz::SpecHelper
end
