
##
# = Tagz
#
# Simple, unified #tag helper module. To add functionality
# to your tags, simply include a module and super to #create_tag
# like below:
#
#   module Tagz
#     module Labels
#       def create_tag name, contents, attrs, &block
#         label = attrs.delete :label
#         if label && label_tag?(name)
#           tag(:label, "#{label}:", :for => attrs[:name]) << super
#         else
#           super
#         end
#       end
#       
#       def label_tag? name
#         name.to_s.in? %w( textarea input select )
#       end
#     end
#   end
#   
#   include Tagz::Labels
#
# With our newly included Tagz::Labels, all calls to #tag will
# be passed to #create_tag, in turn adding our labels when
# appropriate.
#
#   tag :textarea, :name => :comments, :label => 'Comments'
#
#   <label for="comments">Comments:</label>
#   <textarea name="comments"></textarea>
#

module Tagz
  
  #--
  # Self closing elements.
  #++
  
  SELF_CLOSING_TAGS = :input, :link, :base, :area, :br, :hr, :img, :meta
  
  #--
  # Boolean attributes.
  #++
  
  BOOLEAN_ATTRIBUTES = :selected, :checked, :disabled, :readonly, :multiple, :defer
  
  #--
  # Tag
  #++
  
  class Tag
    
    ##
    # Tag name.
    
    attr_reader :name
    
    ##
    # Contents string.
    
    attr_reader :contents
    
    ##
    # Attributes hash.
    
    attr_reader :attrs
    
    ##
    # Block proc.
    
    attr_reader :proc
    
    #:nodoc:
    
    def initialize name, contents = nil, attrs = {}, &block
      @name, @contents, @attrs, @proc = name, (contents || ''), attrs, block
      block.yield_or_eval self if block
    end
    
    ##
    # Append tag to contents.
    
    def tag *args, &block
      @contents << Tagz.tag(*args, &block).to_s
    end
    
    ##
    # Return tag string.
    
    def to_s
      create_tag name, contents, attrs, &proc
    end
  end
  
  module_function
  
  ##
  # Return markup for tag _name_. Optionally _contents_ may
  # be passed, which is literal content for spanning tags such
  # as textarea, etc. A hash of _attrs_ may be passed as the
  # second or third argument.
  #
  # Self closing tags such as <br/>, <input/> etc are automatically
  # closed, and boolean attributes of "selected", "checked" etc
  # are mirrored or removed when true or false.
  #
  # === Examples
  #
  #   tag :br
  #   # => <br/>
  #
  #   tag :div
  #   # => <div></div>
  #
  #   tag :div, 'hello'
  #   # => <div>hello</div>
  #
  #   tag :div, 'hello', :id => 'comment'
  #   # => <div id="comment">hello</div>
  #
  #   tag :div, :id => 'comment'
  #   # => <div id="comment"></div>
  #
  #   tag :div do
  #     tag :p, 'Hello World'
  #   end
  #   # => <div><p>Hello World</p></div>
  #
  #   tag :div do |div|
  #     div.tag :p, 'Hello World'
  #   end
  #   # => <div><p>Hello World</p></div>
  #
  #   tag :input, :type => :checkbox, :checked => true
  #   # => <input type="checkbox" checked="checked" />
  #
  
  def tag name, contents = nil, attrs = {}, &block
    attrs, contents = contents, nil if contents.is_a? Hash
    Tag.new(name, contents, attrs, &block).to_s
  end
  
  #:stopdoc:
  
  def create_tag name, contents = nil, attrs = {}
    self_closing_tag?(name) ?
      self_closing_tag(name, attrs) :
        open_tag(name, attrs) + contents.to_s + closing_tag(name)    
  end
  
  ##
  # Check if _name_ is a boolean attribute.
  
  def boolean_attribute? name
    name.in? BOOLEAN_ATTRIBUTES
  end
  
  ##
  # Check if tag _name_ is a self-closing tag.
  
  def self_closing_tag? name
    name.in? SELF_CLOSING_TAGS
  end
  
  ##
  # Return a self closing tag of _name_, with _attrs_.
  
  def self_closing_tag name, attrs = {}
    "\n<#{name}#{normalize_html_attributes(attrs)}/>"
  end
  
  ##
  # Return an opening tag of _name_, with _attrs_.
  
  def open_tag name, attrs = {}
    "\n<#{name}#{normalize_html_attributes(attrs)}>"
  end
  
  ##
  # Normalize _attrs_, replacing boolean keys
  # with their mirrored values.
  
  def normalize_html_attributes attrs = {}
    return if attrs.blank?
    attrs.each do |name, value|
      if boolean_attribute? name
        value ? attrs[name] = name : attrs.delete(name)  
      end
    end
    ' ' + attrs.to_html_attributes
  end
  
  ##
  # Return closing tag of _name_.
  
  def closing_tag name
    "</#{name}>"
  end
end