
module Formz
  
  ##
  # = Formz::Errors
  #
  # Adds classes and error messages when :error is
  # present for any field.
  #
  # === Examples
  #
  #   password :password, :label => 'Password', :error => 'Invalid Password'
  #
  #   <div class="field-password">
  #     <label for="password">Password:</label>
  #     <input name="password" class=" error" type="password" value="" />
  #     <span class="error-message">Invalid Password</span>
  #   </div>
  
  module Errors
    
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
