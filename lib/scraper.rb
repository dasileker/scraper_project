require 'httparty'
require 'nokogiri'

class Scraper

  attr_reader :result

  def initialize

    @page = page 
    @query = query
    @page = if @page == 1
              ''
            else
              '/' + @pgae.to_s
            end
    @html = 'https://katcr.to/usearch/' + @query + @page + '/'
    @count = 0
    @result = 0
  end

  def scraper
    @raw = HTTParty.get(@html)
    @vue = Nokogiri::HTML(@raw)
    div = @vue.css('table.data')
    @table = div.css('tbody')
  end

end