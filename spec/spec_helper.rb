
$:.unshift File.dirname(__FILE__) + '/../lib'
$:.unshift '/Users/tjholowaychuk/scripts/gems/tags/lib'
require 'rubygems'
require 'dm-core'
require 'dm-validations'
require 'factory_girl'
require 'rspec_hpricot_matchers'
require 'formz'

class FormFactory
  include Tagz
  include Tagz::Helpers
  include Formz::Labels
  include Formz::Descriptions
  include Formz::Errors
  include Formz::Wrappers
  include Formz::Helpers
  include Formz::AutoEncoding
  include Formz::FauxMethod
  include Formz::Models
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
