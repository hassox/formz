
module Formz
  module AutoEncoding
    def file *args, &block
      @__form_encoding = 'multipart/form-data'
      super
    end
  end
end