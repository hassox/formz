
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'rubygems'
require 'rgauge'
require 'formz/import'

benchmark 'Forms', :times => 1000 do
  report 'tag' do 
    tag :div, 'contents'
  end
  report 'checkbox' do 
    checkbox :delete, :label => 'Delete'
  end
  report 'select' do 
    select :days, { :mon => 'Monday', :fri => 'Friday' }, :id => 'days', :label => 'Select day'
  end
end