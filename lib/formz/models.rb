
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
        form model_name(model), attrs, &block  
      end
    end
    
    def create_tag name, contents, attrs, &block
      unless form_context.blank? || name == :form
        attrs[:name] = '%s[%s]' % [attrs[:name], model_name(form_context.last)]
        super
      else
        super
      end
    end
    
    ##
    # Return lowercase name of _model_. Forum::Post
    # will become 'post', etc.
    
    def model_name model
      model.class.to_s.split('::').last.downcase
    end
        
  end
end