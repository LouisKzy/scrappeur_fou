require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://ruby.bastardsbook.com//"))
puts page.class   # => Nokogiri::HTML::Document