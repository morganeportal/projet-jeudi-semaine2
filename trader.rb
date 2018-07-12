require 'rubygems'
require 'nokogiri'   
require 'open-uri'

def get_the_moneyhash()
	result = {}
	page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))  
	a = page.xpath('//tbody/tr')
	#a = page.xpath('//*[@id="id-bitcoin"]')
	for node in a
		data = node.text.split
		result[data[2]] = data[5]
	end
	return result
end

puts(get_the_moneyhash)
