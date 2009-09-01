
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
    # Push _model_ as the current context while executing
    # _block_; returning _block_'s results.
    
    def with_form_context model, &block
      form_context.push model
      result = yield
      form_context.pop
      result
    end
    
    ##
    # Return a form in context to _model_. Model may be
    # an object, class, or symbol.
    
    def form_for model, attrs = {}, &block
      model = model.new if model.is_a? Class
      model = Object.const_get(model).new if model.is_a? Symbol
      with_form_context model do
        form model_name(model), attrs, &block  
      end
    end
    
    def create_tag name, contents, attrs, &block
      unless name == :form || form_context.blank?
        model = form_context.last
        if model_has_property? model, attrs[:name]
          attrs[:name] = '%s[%s]' % [model_name(model), attrs[:name]]
          value = model.send attrs[:name]
          case name
          when :textarea ; contents = value
          when :select   ; @__selected_value = value
          else             attrs[:value] = value
          end
        elsif name == :option
          if @__selected_value == attrs[:value].to_s
            attrs[:selected] = true
          end
        end
      end
      super
    end
    
    ##
    # Check if _model_ has _property_name_.
    
    def model_has_property? model, property_name
      model.send(:properties).any? do |property|
        property.name == property_name.to_sym
      end
    end
    
    ##
    # Return lowercase name of _model_. Forum::Post
    # will become :post, etc.
    
    def model_name model
      model.class.to_s.split('::').last.downcase.to_sym
    end
        
  end
end