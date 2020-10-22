require 'nokogiri'
require 'pry'
require 'httparty'
require 'open-uri'
require 'csv'


def scraper
  page = "https://www.avito.ma/fr/maroc/v%C3%A9hicules-%C3%A0_vendre?o=1"
  unparsed_page = HTTParty.get(page)
  parsed_page = Nokogiri::HTML(unparsed_page)
  carss = Array.new
  cars = parsed_page.css('div.listing listing-thumbs, div.ctext2')
  

end