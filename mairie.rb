require 'rubygems'
require 'nokogiri'   
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage(url)
	page = Nokogiri::HTML(open(url))  
	page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end

#puts(get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/95/vaureal.html"))

def get_all_the_urls_of_val_doise_townhalls()
	page = 	Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))  
	a = page.xpath('//p/a')
	result = {}
	a.each do  |node| 
		result[node.text] ='http://annuaire-des-mairies.com'+node['href']
	end
	return result
end


puts(get_all_the_urls_of_val_doise_townhalls)

