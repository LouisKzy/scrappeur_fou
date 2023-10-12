require 'nokogiri'
require 'open-uri'

# lien de la page ou va va parse
url_mairies = Nokogiri::HTML(URI.open("https://annuaire-des-mairies.com/95/"))
all_href_mairies = []


p url_mairies.xpath('//*[@id="voyance-par-telephone"]/table/tbody/tr[2]/td/table/tbody/tr/td[1]/p/a[@href="lientxt"]')
# url_mairies.first(20).each do |href|
#   # a chaque itération on stock le nom selon son emplacement dans le tableau ici 1 a 20
#   p href
#   return all_href_mairies << href.text
# end
# p all_href_mairies