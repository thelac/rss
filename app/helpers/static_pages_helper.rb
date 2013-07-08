require 'ruby-readability'
require 'open-uri'

module StaticPagesHelper
	## Test functions
	def test_readability
		source = open('http://www.nytimes.com/2013/07/07/world/middleeast/egypt.html?hp').read
		return Readability::Document.new(source).content
	end

end
