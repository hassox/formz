
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'rubygems'
require 'rgauge'
require 'formz/import'

benchmark 'Forms', :times => 200 do
  report 'tag' do 
    tag :div, 'contents'
  end
  report 'tag with everything' do 
    tag :textarea, 'contents', :label => 'Comments', :required => true, :description => 'Leave a comment.'
  end
  report 'input' do 
    checkbox :delete
  end
  report 'input with everything' do 
    checkbox :delete, :label => 'Delete', :required => true, :description => 'Delete the data.'
  end
  report 'select' do 
    select :days, { :mon => 'Monday', :fri => 'Friday' }, :id => 'days'
  end
  report 'select with everything' do 
    select :days, { :mon => 'Monday', :fri => 'Friday' }, :id => 'days', :label => 'Days', :required => true,
      :description => 'Select a day.'
  end
end