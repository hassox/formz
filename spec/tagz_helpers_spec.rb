
describe Tagz do
  describe Helpers do
    it "should allow calling helpers within tag blocks" do
      markup = tag :head do |head|
        head.meta :keywords, 'foo bar'
        head.meta :description, 'some foo bar'
      end
      markup.should have_tag('head') do |head|
        head.should have_tag('meta[@name=keywords]')
        head.should have_tag('meta[@name=description]')
      end
    end
    
    describe "#cdata" do
      it "should return a CDATA tag" do
        cdata('<foo>').should == '<![CDATA[<foo>]]>'
      end
    end
    
    describe "#meta" do
      it "should accept name and contents" do
        meta(:keywords, 'some foo bar').should have_tag('meta[@name=keywords]')
        meta(:keywords, 'some foo bar').should have_tag('meta[@contents=some foo bar]')
      end
    end
    
    describe "#image" do
      it "should accept a path as the first argument" do
        image('foo.png').should have_tag('img[@src=foo.png]')
      end
      
      it "should accept a hash of attributes" do
        image('foo.png', :alt => 'Kung-foo').should have_tag('img[@alt=Kung-foo]')
      end
    end
    
    describe "#stylesheet" do
      it "should return inline style tags when a block is passed" do
        markup = stylesheet do
          'body {}'
        end
        markup.should have_tag('style', 'body {}')
      end
      
      it "should assign rel attribute" do
        stylesheet('style.css').should have_tag('link[@rel=stylesheet]')
      end
      
      it "should assign href attribute" do
        stylesheet('style.css').should have_tag('link[@href=style.css]')
      end
      
      it "should accept a hash of attributes" do
        stylesheet('style.css', :media => :print).should have_tag('link[@media=print]')
      end
    end
  end
  
  describe "#javascript" do
    it "should return inline javascript tag when a block is passed" do
      markup = javascript do
        'foo'
      end
      markup.should have_tag('script', 'foo')
    end
    
    it "should assign type attribute" do
      javascript('jquery.js').should have_tag('script[@type=text/javascript]')
    end
    
    it "should assign src attribute" do
      javascript('jquery.js').should have_tag('script[@src=jquery.js]')
    end
    
    it "should accept a hash of attributes" do
      javascript('jquery.js', :foo => :bar).should have_tag('script[@foo=bar]')
    end
  end
end