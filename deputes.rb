require 'rubygems'
require 'nokogiri'   
require 'open-uri'

def get_the_email(url)
	page = Nokogiri::HTML(open(url))  
	a = page.xpath('//dd/ul/li/a')
	return a[1]['href'].split(":")[1]
end

#puts(get_the_email("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA720124"))
def get_the_hash()
	result = []
	page = Nokogiri::HTML(open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))  
	a = page.xpath('//option')
	# puts(a.length)

	for i in 1..a.length-1
		url = 'http://www2.assemblee-nationale.fr' + a[i]['value']
		email = get_the_email(url)
		prenom = a[i].text.split[1]
		nom = a[i].text.split[2]

		deputy = {
			'first-name' => prenom ,
			'last-name' => nom ,
			'email' => email ,
		}
		result.push deputy
		puts(deputy)
	end
	return result
end

get_the_hash

