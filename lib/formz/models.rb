
module Formz
  
  ##
  # = Formz::Models
  #
  
  module Models
    
    ##
    # Return a form in context to _model_.
    
    def form_for model, attrs = {}, &block
      @__form_model = model
      name = model.class.to_s.split('::').last.downcase
      form name, attrs, &block
    ensure
      @__form_model = nil 
    end 
    
  end
end