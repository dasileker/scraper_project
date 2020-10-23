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