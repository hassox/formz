
##
# = Labels
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

module Formz
  module Labels
    NESTED_LABEL_INPUT_TYPES = :checkbox, :radio
    
    def create_tag name, contents, attrs, &block
      if name != :optgroup && string = attrs.delete(:label)
        label_attrs = { :for => attrs[:name], :required => attrs.delete(:required) }
        if nested_label_input? attrs[:type]
          label string, super, label_attrs
        else
          label(string, label_attrs) + super
        end
      else
        super
      end
    end
    
    def nested_label_input? name
      name.in? NESTED_LABEL_INPUT_TYPES
    end

    def label string, contents = nil, attrs = {}
      attrs, contents = contents, nil if contents.is_a? Hash
      required = attrs.delete :required
      suffix = contents ? '' :
                 required ? '<em>*</em>:' :
                   ':'
      tag :label, contents.to_s + string + suffix, attrs
    end
  end
end