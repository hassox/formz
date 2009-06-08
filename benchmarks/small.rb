
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'rubygems'
require 'rgauge'
require 'formz/import'

benchmark '', :times => 200 do
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
    select :days, { :mon => 'Monday', :fri => 'Friday' }, :id => 'days', 
      :label => 'Days', :required => true, :description => 'Select a day.'
  end
  report 'full form' do 
    form :register, :action => '/register' do
      fieldset :login, 'Login Information' do
        text :username, :label => 'Username'
        password :password, :label => 'Password'
        password :password_confirm, :required => true, :description => 'Enter password between 6 - 30 characters.'
      end
      fieldset :account, 'Account Details' do
        text :country, :label => 'Country'
        text :city, :label => 'City'
        fieldset :forum, 'Forum Related' do
          file :image, :label => 'Avatar'
          textarea :signature, :label => 'Signature'
        end
      end
      buttons do
        submit :op, 'Join'
        submit :cancel, 'Cancel'
      end
    end
  end
end