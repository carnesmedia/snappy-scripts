#!/usr/bin/env ruby

require "nokogiri"
require "open-uri"

URL = ENV["SNAP_URL_ROOT"]
HTTP_URL = "http://" + URL

doc = Nokogiri::HTML(open(HTTP_URL))
links = doc.css(ENV["CSS_PATH"]).map { |link| link["href"] }.uniq

unless ARGV[1]
  puts "Running in dry mode. Run script with any arg to confirm opening in Web Snapper."
end

links.each do |link|
  full_url = URL + link
  puts full_url
  if ARGV[1]
    system("open", "websnap://#{full_url}")
    sleep 0.1
  end
end
