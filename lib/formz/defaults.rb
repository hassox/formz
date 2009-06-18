
module Formz
  
  ##
  # = Formz::Defaults
  #
  # The Formz:Defaults 
  #
  # === Examples
  #
  #   tag :input, :type => :file, :name => :upload
  #
  #   <div class="field-upload field-file">
  #     <input type="file" name="upload" />
  #   </div>
  #
  
  module Defaults
    def create_tag name, contents, attrs, &block
      super
    end    
  end
end