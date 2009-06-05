
# TODO: fix buffer ... screws up and adds legend twice due to several blocks

result = form :register, :action => '/register' do
  fieldset :login, 'Login Information' do
    
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
puts result