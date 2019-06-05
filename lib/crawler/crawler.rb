require 'rubygems'
require 'mechanize'
require_relative '../website-handler/website.rb'
require 'open-uri'

a = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Safari'
}

current_url = 'https://en.wikipedia.org/wiki/Cleopatra'
links_found = []

while (current_url)
break if links_found.size > 1000
a.get(current_url) do |page|
  page.links.each do |link|
    unless links_found.include? (link.resolved_uri)
#      puts link.methods - Object.methods
      links_found << link.resolved_uri
#      puts links_found.size
    end
  end
end

#break if links_found.size > 5000

current_url = links_found[20]
puts current_url
puts links_found.size
links_found.shift
end

#begin
Comparer.new

for x in (1..links_found.size)
  puts Comparer.compare_urls(links_found[x], links_found[x - 1])
end
#end
