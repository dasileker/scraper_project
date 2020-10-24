#!/usr/bin/env ruby
require 'nokogiri'
require 'httparty'
require_relative '../lib/scraper_table'
require_relative '../lib/scraper'

def check_input(input)
  gets.downcase.chomp.gsub(' ', '%20') if input.nil?
end

def user_inputs
  input = gets.downcase.chomp
  if input.to_i.zero?
    input = input.to_s.gsub(' ', '%20')
  else
    input.to_i
  end
  input
end

def crawling_site(input = nil, query = nil, total = nil, page = 1)
  loop do
    if input.nil?
      input = check_input(input)
    elsif query.to_i.zero?
      input = query.gsub(' ', '%20')
      pages = 1
    elsif query.to_i > (total / 20)
      p 'Page does not exist, wait 3 seconds for reboot.'
      sleep(3)
      pages = page
    else
      pages = query.to_i
    end
    total = display_results(pages, input)
    query = user_inputs
    break if query == 'exit'
  end
end

def display_results(pages, input)
  scrape_site = Scraper.new(input, pages)
  scrape_site.data
  puts scrape_site.extract_torrent
  total = scrape_site.total_results
  table_object = ScrapedTable.new(pages, input, total)
  puts table_object.display_table
  p 'To jump to a new page enter it bellow, or enter a new query. Type exit and hit enter to stop the script.'
  total
end

p '/-/-/-/-/Search any Torrents/-/-/-/-/'
p '/-/-/-/-/Whats the name of it?/-/-/-/-/'
crawling_site

p '/*/ Thank you /*/'
