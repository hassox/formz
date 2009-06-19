
module Formz
  
  ##
  # = Formz::AutoEncoding
  #
  # Automatically sets form enctype to 'multipart/form-data' 
  # when a file field is present.
  
  module AutoEncoding
    def create_tag name, contents, attrs, &block
      @__form_encoding = 'multipart/form-data' if name == :file
      super
    end
  end
end