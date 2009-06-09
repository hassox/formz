
module Formz
  
  ##
  # = Formz::AutoEncoding
  #
  # Automatically sets form enctype to 'multipart/form-data' 
  # when a file field is present.
  
  module AutoEncoding
    def file *args, &block
      @__form_encoding = 'multipart/form-data'
      super
    end
  end
end