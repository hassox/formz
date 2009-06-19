
module Formz
  
  ##
  # = Formz::Descriptions
  #
  # The Formz:Descriptions module allows a :description attribute
  # to be passed, which then appends a tag containing the field
  # description.
  #
  # === Examples
  #
  #   tag :input, :type => :file, :name => :upload, :description => 'Upload a file.'
  #
  #   <div class="form-upload form-file">
  #     <input type="file" name="upload" />
  #     <span class="description">Upload a file.</span>
  #   </div>
  #
  
  module Descriptions
    def create_tag name, contents, attrs, &block
      if description = attrs.delete(:description)
        super << tag(:span, description, :class => 'description')
      else
        super
      end
    end
  end
end