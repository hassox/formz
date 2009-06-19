
module Formz
  
  ##
  # = Formz::FauxMethod
  #
  # Fake out methods using the hidden field '_method'
  # when the HTTP method is not GET or POST.
  
  module FauxMethod
    
    def create_tag name, contents, attrs, &block
      if name == :form
        attrs[:method] = :post unless :method.in? attrs
        unless valid_http_method? attrs[:method]
          method = hidden :_method, attrs[:method]
          attrs[:method] = :post
          contents = contents.to_s << method
        end
      end
      super
    end
    
    ##
    # Check if _method_ is a valid form HTTP verb. (get, post).
    
    def valid_http_method? method
      method.to_s.in? 'post', 'get'
    end
  end
end
