require 'nokogiri'
require 'open-uri'

def get_url
  # lien de la page ou va va parse
  url = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
  
end


def get_name_crypto_in_array(page)
  # lien de la page ou va va parse
  
  # variable pour l'array ou stocké 
  all_crypto_symbol =[]
  # extraction du Xpath
  crypto_symbol_xpath = page.xpath('//td[contains(@class, "by__symbol")]') #methode de vincent pour le xpath
  puts "Exctraction des symboles.."
  # boucles 20 fois pour gerer le cas ou il a des crypto parce que le site est mal codé avec le css
  crypto_symbol_xpath.first(20).each do |crypto_symbol|
    # a chaque itération on stock le nom selon son emplacement dans le tableau ici 1 a 20
    all_crypto_symbol << crypto_symbol.text
    end
  puts "check"
  puts " affichage des symboles extraits"
  # affichage du résultat des 20 itérations
  p all_crypto_symbol
  puts " "
  # return l'array pour l'argument de la fonction get_crypto array
 return all_crypto_symbol
end

def get_price_crypto_in_array(page)
  all_crypto_price = []
 
  cryptos_prices_xpath = page.xpath('//td[contains(@class, "by__price")]') # indan methode pour le xpath
  puts "Exctraction des prix.."
  
  cryptos_prices_xpath.first(20).each do |crypto_price|
    
    all_crypto_price << crypto_price.text
    end
  puts "check"
  puts " "
  puts "affichage des prix extraits"
  
  p all_crypto_price
  puts " "
  
  return all_crypto_price
end

def get_crypto_array(hash_name,hash_price)
  puts " affichage de l'enssemble des donnée réunis"
  puts " "
  hash_symbol_price = Hash[hash_name.zip(hash_price).to_h]
  crypto_array = hash_symbol_price.map{|crypto, price|{crypto => price}}
  puts crypto_array
end



get_crypto_array(get_name_crypto_in_array(get_url()),get_price_crypto_in_array(get_url()))



