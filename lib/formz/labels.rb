
module Formz
  
  ##
  # = Formz::Labels
  #
  # The Formz:Labels module allows a :label attribute
  # to be passed, which then adds a label tag to the
  # markup output. Tags are nested nested within its
  # label, in cases such as for checkboxes or radio
  # buttons.
  #
  # When using labels, a :required attribute may also 
  # be passed, which will alter the markup to indicate
  # the input field is required.
  #
  # === Examples
  #
  #   tag :input, :type => :file, :name => :upload, :label => 'Upload', :required => true
  #
  #   <div class="form-upload form-file">
  #     <label for="upload">Upload<em>*</em>:</label>
  #     <input type="file" name="upload" />
  #   </div>
  #
  
  module Labels
    NESTED_LABEL_INPUT_TYPES = :checkbox, :radio
    
    def create_tag name, contents, attrs, &block
      if name != :optgroup && string = attrs.delete(:label)
        label_attrs = { :for => attrs[:name], :required => attrs.delete(:required) }
        if attrs[:type].in? NESTED_LABEL_INPUT_TYPES
          label string, super, label_attrs
        else
          label(string, label_attrs) << super
        end
      else
        super
      end
    end

    ##
    # Return a label with _string_. When _contents_
    # is present the label will act as a wrapper for
    # checkboxes, radios etc.
    
    def label string, contents = nil, attrs = {}
      attrs, contents = contents, nil if contents.is_a? Hash
      Tagz.tag :label, contents.to_s + string + (contents ? '' :
            attrs.delete(:required) ? '<em>*</em>:' :
              ':'), attrs
    end
  end
end