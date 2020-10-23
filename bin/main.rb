# !/usr/bin/env ruby

require 'nokogiri'
require 'httparty'
require_relative '../lib/scraper.rb'


def input(input)
  gets.downcase.chomp.gsub(' ', '%20') if input.nil?
end

def user
  input = gest.downcase.chomp
  if input.to_i.zero?
    input.to_s.gsub(' ', '%20')
  else
    input.to_i
  end
  input
end

def site(input = nil, query = nil, total = nil, page = 1)
  loop do 
    if input.nil?
      input = inputs(input)
    elsif query.to_i.zero?
      input = query.gsub(' ', '%20')
      page = 1
    elsif query.to_i > (total/ 20)
      p 'Page not found, wait to reboot.'
      sleep(3)
      page = page 
    else
      page = query.to_i
    end
    total = show_results(page, input)
    query = user
    break if query == 'exit'
  end


  def show_results(page, input)
    scrape = Scraper.new(input, page)
    scrape.scraper
    puts scrape.torent
    total = scrape.result
    object = ScrapedTable.new(page, input, total)
    puts object.display
    p 'To go to  the next page, enter bellow, or search new Query. type exit to exit the  running code.'
    total
  end
end

p '***Search any Torrents***'
p '*****what torrent you want to scrape?******'
site

p '/*****If you like this project please approve it\u{1f600}*****/'

