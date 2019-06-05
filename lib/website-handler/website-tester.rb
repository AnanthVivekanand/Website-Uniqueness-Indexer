require_relative 'website.rb'

url1 = 'http://google.com'
url2 = 'https://duckduckgo.com'

Comparer.new

puts Comparer.compare_urls(url1, url2)
