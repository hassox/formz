
module Formz
  
  ##
  # = Formz::FauxMethod
  #
  # Fake out methods using the hidden field '_method'
  # when the HTTP method is not GET or POST.
  
  module FauxMethod
    
    ##
    # Return a form.
    
    def form name, attrs = {}, &block
      unless valid_http_method? attrs[:method]
        method = hidden :_method, attrs[:method]
        attrs[:method] = :post
      end
      tag :form, method || nil, { :id => "form-#{name}" }.merge(attrs), &block
    end
    
    ##
    # Check if _method_ is a valid form HTTP verb. (get, post).
    
    def valid_http_method? method
      method.to_s.in? %w( post get )
    end
  end
end
