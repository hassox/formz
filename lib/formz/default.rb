
module Formz
  
  ##
  # = Formz::Default
  #
  # The Formz:Default module contains
  # several modules related to defaulting the
  # values of form elements. For example
  # the Default::Params module will default
  # values when specified #param values are
  # present from requests.
  
  module Default
    
    ##
    # = Formz::Default::Params
    #
    # Defaults values using the #params hash.
    # Supports regular and model usage.
    
    module Params
      def create_tag name, contents, attrs, &block
        super
      end
    end

    ##
    # = Formz::Default::Models
    #
    # Defaults values using model properties.
    
    module Models
      def create_tag name, contents, attrs, &block
        super
      end
    end
  end
end