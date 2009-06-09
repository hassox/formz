
$:.unshift 'lib'
require 'formz'
require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new "formz", Formz::VERSION do |p|
  p.author = "TJ Holowaychuk"
  p.email = "tj@vision-media.ca"
  p.summary = "Framework independant tag helpers"
  p.url = "http://github.com/visionmedia/formz"
  p.runtime_dependencies << 'visionmedia-tagz >= 1.0.0'
  p.development_dependencies << 'rspec_hpricot_matchers >= 1.0.0'
  p.development_dependencies << 'thoughtbot-factory_girl'
end

Dir['tasks/**/*.rake'].sort.each { |f| load f }