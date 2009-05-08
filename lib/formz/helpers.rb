
##
# = Helpers
#
# The Formz:Helpers module provides unbound form related
# helper methods such as #checkbox, #password and others.

module Formz
  module Helpers
    # TODO: refactor so switch of args is not needed ...create_tag
    %w( checkbox radio text submit reset hidden button password file ).each do |name|
      class_eval <<-END
        def #{name} name, value = nil, attrs = {}
          attrs, value = value, nil if value.is_a? Hash
          attrs[:value] ||= value
          tag :input, { :type => :#{name}, :name => name }.merge(attrs)
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

    def select_options select_options, options = {}
      normalize_select_prompt select_options, options
      select_options.map do |key, value|
        if value.is_a? Hash
          tag :optgroup, select_options(value, options), :label => key
        elsif options[:selected] == key
          select_option key, value, :selected => true
        else
          select_option key, value
        end
      end.join
    end

    def normalize_select_prompt select_options, options = {}
      return unless :prompt.in? options
      prompt = options.delete :prompt
      options[:selected] = '' unless :selected.in? options
      select_options[''] = String === prompt ? prompt : '- Select -'
    end
    # radio / checkbox groups
    # %w( form fieldset legend select textarea )
  end
end