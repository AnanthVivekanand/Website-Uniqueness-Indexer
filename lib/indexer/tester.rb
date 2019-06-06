require_relative 'crawler.rb'
require 'concurrent'

s = Unique::LinkScaper.new

i = s.scrape_urls(5)
puts i
