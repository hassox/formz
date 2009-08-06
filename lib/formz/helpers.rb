
module Formz
  
  ##
  # = Formz::Helpers
  #
  # The Formz:Helpers module provides unbound form related
  # helper methods such as #checkbox, #password and others.
  
  module Helpers
    
    ##
    # Return a form.
    
    def form name, attrs = {}, &block
      Tagz.tag :form, { :id => "form-#{name}" }.merge(attrs), &block
    end
    
    ##
    # Return a legend with _contents_.

    def legend contents, attrs = {}, &block
      Tagz.tag :legend, contents, attrs, &block
    end
    
    ##
    # Return a fieldset with optional _legend_.
    
    def fieldset name, legend = nil, attrs = {}, &block
      attrs, legend = legend, nil if legend.is_a? Hash
      Tagz.tag :fieldset, legend ? legend(legend) : nil, { :id => "fieldset-#{name}" }.merge(attrs), &block
    end
    
    ##
    # Return a textarea.
    
    def textarea name, contents = nil, attrs = {}, &block
      attrs, contents = contents, nil if contents.is_a? Hash
      Tagz.tag :textarea, contents, { :name => name }.merge(attrs), &block
    end
    
    ##
    # Wrap form buttons defined within _block_ in a div.
    
    def buttons attrs = {}, &block
      Tagz.tag :div, { :class => 'form-buttons' }.merge(attrs), &block
    end
    
    %w( checkbox radio text submit reset hidden button password file ).each do |name|
      class_eval <<-END
        def #{name} name, value = nil, attrs = {}
          attrs, value = value, nil if value.is_a? Hash
          attrs[:value] ||= value
          Tagz.tag :input, { :type => :#{name}, :name => name }.merge(attrs)
        end
      END
    end
    
    %w( checkbox radio ).each do |name|
      class_eval <<-END
        def #{name}_group name, values, options = {}
          values.map do |key, value|
            #{name} name, key, :label => value, :checked => option_selected?(key, options)
          end.join
        end
      END
    end
    
    ##
    # Return select element _name_ with _options_ hash.
    #
    
    def select name, options, attrs = {}
      options = select_options options, attrs
      attrs.delete :selected
      Tagz.tag :select, options, { :name => name }.merge(attrs)
    end
    
    ##
    # Return select option _contents_ with _value_.

    def select_option value, contents, attrs = {}
      Tagz.tag :option, contents, { :value => value }.merge(attrs)
    end
    
    ##
    # Return select option elements from _values_ with
    # _options_ passed. 
    #
    # === Options
    #
    #   :selected    string, symbol, or array of options selected
    #

    def select_options values, options = {}
      normalize_select_prompt values, options
      values.map do |key, value|
        if value.is_a? Hash
          Tagz.tag :optgroup, select_options(value, options), :label => key
        elsif option_selected? key, options[:selected]
          select_option key, value, :selected => true
        else
          select_option key, value
        end
      end.join
    end
    
    ##
    # Check if option _key_ is _selected_.
    
    def option_selected? key, selected
      Array === selected ? key.in?(selected) : selected == key
    end
    
    ##
    # Normalize select prompt. 
    #
    # * When _options_ contains a :prompt string it is assigned as the prompt
    # * When :prompt is true the default of '- Select -' will become the prompt
    # * The prompt is selected unless a specific option is explicitly selected.
    #

    def normalize_select_prompt values, options = {}
      return unless :prompt.in? options
      prompt = options.delete :prompt
      options[:selected] = '' unless :selected.in? options
      values[''] = String === prompt ? prompt : '- Select -'
    end
     
  end
end