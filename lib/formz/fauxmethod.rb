
module Formz
  
  ##
  # = Formz::FauxMethod
  #
  # Fake out methods using the hidden field '_method'
  # when the HTTP method is not GET or POST.
  
  module FauxMethod
    
    ##
    # Return array of form errors.
    
    def form_errors
      @__form_errors ||= []
    end
    
    def create_tag name, contents, attrs, &block
      attrs, contents = contents, nil if contents.is_a? Hash
      if error = attrs.delete(:error)
        form_errors << error
        (attrs[:class] ||= '').add_class 'error'
        super << super(:span, error, :class => 'error-message')
      else
        super
      end
    end
  end
end
