
module Formz
  
  ##
  # = Formz::Models
  #
  
  module Models
    
    ##
    # Return a form.
    
    def form_for model, attrs = {}, &block
      name = model.class.to_s.split('::').last.downcase
      form name, attrs, &block
    end 
    
  end
end