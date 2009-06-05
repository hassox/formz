
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
    
    def form name, attrs = {}, &block
      attrs[:enctype] = @__form_encoding if @__form_encoding
      super
    end
  end
end