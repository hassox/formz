
module Formz
  
  ##
  # = Formz::Helpers
  #
  # The Formz:Helpers module provides unbound form related
  # helper methods such as #checkbox, #password and others.
  
  module Helpers

    %w( checkbox radio text submit reset hidden button password file ).each do |name|
      class_eval <<-END
        def #{name} name, value = nil, attrs = {}
          attrs, value = value, nil if value.is_a? Hash
          attrs[:value] ||= value
          tag :input, { :type => :#{name}, :name => name }.merge(attrs)
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
    
    def select name, options, attrs = {}
      options = select_options options, attrs
      attrs.delete :selected
      tag :select, options, { :name => name }.merge(attrs)
    end

    def select_option value, contents, attrs = {}
      tag :option, contents, { :value => value }.merge(attrs)
    end

    def select_options values, options = {}
      normalize_select_prompt values, options
      values.map do |key, value|
        if value.is_a? Hash
          tag :optgroup, select_options(value, options), :label => key
        elsif option_selected? key, options
          select_option key, value, :selected => true
        else
          select_option key, value
        end
      end.join
    end
    
    def option_selected? key, options = {}
      Array === options[:selected] ? 
        key.in?(options[:selected]) :
          options[:selected] == key
    end

    def normalize_select_prompt values, options = {}
      return unless :prompt.in? options
      prompt = options.delete :prompt
      options[:selected] = '' unless :selected.in? options
      values[''] = String === prompt ? prompt : '- Select -'
    end
    
    def legend contents, attrs = {}, &block
      tag :legend, contents, attrs, &block
    end
    
    def form name, attrs = {}, &block
      tag :form, { :id => "form-#{name}" }.merge(attrs), &block
    end
    
    def fieldset name, legend = nil, attrs = {}, &block
      attrs, legend = legend, nil if legend.is_a? Hash
      tag :fieldset, legend ? legend(legend) : nil, { :id => "fieldset-#{name}" }.merge(attrs), &block
    end
    
    def textarea name, contents = nil, attrs = {}, &block
      attrs, contents = contents, nil if contents.is_a? Hash
      tag :textarea, contents, { :name => name }.merge(attrs), &block
    end
    
    def buttons attrs = {}, &block
      tag :div, { :class => 'form-buttons' }.merge(attrs), &block
    end
    
    # radio / checkbox groups
    # %w( form fieldset legend select textarea )
  end
end