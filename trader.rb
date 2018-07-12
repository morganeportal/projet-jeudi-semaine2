require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'pry'

def get_the_moneyhash()
	result = []
	page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))  
	a = page.xpath('//tbody/tr')

	for node in a
		data = node.text.split
		#binding.pry
		nom = data[2]
		prix = data[5]
		devise = {
			'name' => nom ,
			'price' => prix ,
		}
		#binding.pry
		result.push devise
	end
	return result
end

puts(get_the_moneyhash)
