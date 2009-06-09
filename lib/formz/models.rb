
module Formz
  
  ##
  # = Formz::Models
  #
  
  module Models
    
    ##
    # Form context model stack.
    
    def form_context
      @__form_context ||= []
    end
    
    ##
    # 
    
    def with_form_context model, &block
      form_context.push model
      result = yield
      form_context.pop
      result
    end
    
    ##
    # Return a form in context to _model_.
    
    def form_for model, attrs = {}, &block
      with_form_context model do
        name = model.class.to_s.split('::').last.downcase
        form name, attrs, &block  
      end
    end
    
    def create_tag name, contents, attrs, &block
      unless form_context.blank?
        p attrs
        super
      else
        super
      end
    end
        
  end
end