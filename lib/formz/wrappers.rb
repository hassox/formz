
module Formz
  
  ##
  # = Formz::Wrappers
  #
  # The Formz:Wrappers module wraps input, textarea
  # and select tags with wrapping div elements to aid
  # in styling.
  #
  # === Examples
  #
  #   tag :input, :type => :file, :name => :upload
  #
  #   <div class="field-upload field-file">
  #     <input type="file" name="upload" />
  #   </div>
  #
  
  module Wrappers
    WRAP_TAGS = :input, :textarea, :select

    def create_tag name, contents, attrs, &block
      if name.in? WRAP_TAGS
        classes = "field-#{attrs[:name].to_s.gsub('[', '-').gsub(']', '')}"
        classes.add_class "field-#{attrs[:type]}" if :type.in? attrs
        Tagz.tag :div, super, :class => classes
      else 
        super
      end
    end    
  end
end