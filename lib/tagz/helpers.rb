
module Tagz
  
  ##
  # = Helpers
  #
  # Tagz::Helpers consists of methods which
  # assist creation of common tag combinations
  # and standards. For example images may simply
  # call image('foo.png'), as a shortcut for 
  # tag(:img, :src => 'foo.png').
  #
  
  module Helpers

    module_function

    ##
    # Return image tag to _path_.
    #
    # === Examples
    #
    #  image 'foo.png'
    #  # => <img src="foo.png" />
    #
    #  image 'foo.png', :alt => 'Kung-foo'
    #  # => <img src="foo.png" alt="Kung-foo">
    #

    def image path, attrs = {}
      Tagz.tag :img, { :src => path }.merge(attrs)
    end

    ##
    # Return stylesheet link tag to _path_. When a _block_
    # is passed, a style tag will be created with the yielded
    # value as its contents.
    #
    # === Examples
    #
    #   stylesheet do
    #     "body {
    #       color: blue;
    #     }"
    #   end
    #   # => <style>body { ... }</style>
    #
    #
    #   stylesheet 'style.css', :media => :print
    #   # => <link rel="stylesheet" href="style.css" media="print" />
    #

    def stylesheet path = nil, attrs = {}, &block
      return tag(:style, yield, { :type => 'text/css' }.merge(attrs)) if block
      Tagz.tag :link, { :rel => 'stylesheet', :href => path }.merge(attrs)
    end

    ##
    # Return script tag to _path_. When a _block_ is passed, 
    # a script tag will be created with the yielded value as
    # its contents.
    #
    # === Examples
    #
    #   javascript do
    #     "foo"
    #   end
    #   # => <script type="text/javascript">foo</script>
    #
    #   javascript 'jquery.js'
    #   # => <script type="text/javascript" src="jquery.js"></script>
    #  

    def javascript path = nil, attrs = {}, &block
      contents = yield if block
      Tagz.tag :script, contents, { :type => 'text/javascript', :src => path }.merge(attrs)
    end

    ##
    # Return meta tag _name_ with _contents_.
    #
    # === Examples
    #
    #   meta :keywords, 'foo bar'
    #   meta :description, 'Welcome to foo bar'
    #   
    #   # => <meta name="keywords" contents="foo bar">
    #   # => <meta name="description" contents="Welcome to foo bar">
    #

    def meta name, contents
      Tagz.tag :meta, :name => name, :contents => contents 
    end

    ##
    # Return CDATA tag with _contents_.
    #
    # === Examples
    #
    #   cdata '<foo>'
    #   # => <![CDATA[<foo>]]>
    #

    def cdata contents
      "<![CDATA[#{contents}]]>"
    end
    
    #--
    # Delegates
    #++
    
    module Delegates
      %w( cdata meta javascript stylesheet image ).each do |meth|
        class_eval <<-EOF
          def #{meth} *args, &block
            @contents << Tagz::Helpers.#{meth}(*args, &block)
          end
        EOF
      end
    end
    
  end
end