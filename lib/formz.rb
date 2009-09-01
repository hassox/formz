#--
# Copyright (c) 2009 TJ Holowaychuk <tj@vision-media.ca>
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++

$:.unshift '/Users/tjholowaychuk/scripts/gems/tagz/lib' 
require 'tagz'
require 'formz/version'

module Formz
  autoload :Labels, 'formz/labels'
  autoload :Errors, 'formz/errors'
  autoload :Models, 'formz/models'
  autoload :Default, 'formz/default'
  autoload :Helpers, 'formz/helpers'
  autoload :Wrappers, 'formz/wrappers'
  autoload :FauxMethod, 'formz/fauxmethod'
  autoload :Descriptions, 'formz/descriptions'
  autoload :AutoEncoding, 'formz/autoencoding'
  module Default
    autoload :Params, 'formz/default'
    autoload :Models, 'formz/default'
  end
end

Tagz::Tag.send :include, Formz::Helpers::Delegates