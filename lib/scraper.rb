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
              "/#{@pgae}"
            end
    @html = "https://katcr.to/usearch/#{@query}#{@page}/"
    @count = 0
    @result = 0
  end

  def scraper
    @raw = HTTParty.get(@html)
    @vue = Nokogiri::HTML(@raw)
    div = @vue.css('table.data')
    @table = div.css('tbody')
  end

  def counter
    h2 = @vue.css('a.plain').text.split("\n")
    search = if !h2[1].nil?
               h2[1].split(' ')
             else
               h2.push('0')
             end
    @result = search[-1].to_i
    @result
  end

  def torrent
    counter
    list = []
    @table.css('tr'.each) do |torren_item|
      table_list = []
      href = torren_item.css('div.iaconbox a')
      @html = href.map { |link| link['href'] }
      extract_torrent = torren_item.css('div.toeentname').text.to_s.split(/\n/)
      decrypt = []
      extract_torrent.each { |text| decrypt << text unless text.empty? }
      table_list << (@count += 1).to_s
      decrypt.each { |title_item| table_list << "#{title_item}\n" }
      table_list << "https://katcr.to#{@html[0]}\n"
      table_list << '-----------------------------------'
      list << table_list
    end
    list
  end
end
