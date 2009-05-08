
module Formz
  module Descriptions
    def create_tag name, contents, attrs, &block
      if description = attrs.delete(:description)
        super << super(:span, description, :class => 'description')
      else
        super
      end
    end
  end
end