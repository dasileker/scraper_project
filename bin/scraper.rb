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
    @html = 'hhtps://katcr.to/search' +@query + @page + '/'
    @count = 0
    @result = 0
  end

end