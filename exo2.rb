require 'nokogiri'
require 'open-uri'
require 'byebug'

def scrap
		
	url = "http://annuaire-des-mairies.com/val-d-oise.html"
	page = Nokogiri::HTML(URI.open(url))
	noms = page.xpath('//a[@class="lientxt"]').map{|element| element = element.text}

  	town_urls_array = []
 	
  	arr_hash = []


  	


 	page.each do |url|
    	town_urls_array.push(url.text.delete_prefix('.').prepend('https://www.annuaire-des-mairies.com'))

    end

    email = []

    nb = town_urls_array.length

    nb.times do |index|
    	page_mail = Nokogiri::HTML(URI.open(town_urls_array [index]))
		emails = page_mail.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
		puts email
	end

puts noms
	
end

scrap






