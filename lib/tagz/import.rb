
require 'tagz'

include Tagz
include Tagz::Helpers

Tagz::Tag.send :include, Tagz::Helpers::Delegates