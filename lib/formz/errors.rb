
module Formz
  
  ##
  # = Formz::Errors
  #
  
  module Errors
    def create_tag name, contents, attrs, &block
      if error = attrs.delete(:error)
        (@__form_errors ||= []) << error
        (attrs[:class] ||= '').add_class 'error'
        super
      else
        super
      end
    end
  end
end
