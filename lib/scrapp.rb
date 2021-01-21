require 'nokogiri'
require 'httparty'
require 'byebug'

def scrap
	url = "https://coinmarketcap.com/all/views/all/"
	pas_analyse = HTTParty.get(url)
	analyse = Nokogiri::HTML(pas_analyse)
	arr_name = analyse.xpath('//*[@class="cmc-table-row"]//td[3]/div').map{|element| element = element.text}
	arr_value = analyse.xpath('//*[@class="cmc-table-row"]//td[5]/div').map{|element| element = element.text}

	arr_final_value = arr_value.map

	hash_final = Hash[arr_name.zip(arr_final_value.map)]

	byebug

end

scrap