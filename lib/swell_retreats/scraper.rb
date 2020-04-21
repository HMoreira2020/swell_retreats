require 'net/http'
require 'nokogiri' 
require 'open-uri'
require 'pry'

class Scraper
  attr_accessor :name, :dates, :availability, :url 
  
 
  def self.scrape_homepage(site)
    page = Nokogiri::HTML(open(site))
    retreats_array = []
    page.css("tbody tr").collect do |retreat| 
      retreat_hash = {
        :name => retreat.css("td.rs-title").text.strip,
        :dates => retreat.css("td.rs-dates").text.strip,
        :availability => retreat.css("td.rs-availability-words").text.strip, 
        :url => retreat.css("td a").attribute("href").value.strip
      }
      retreats_array << retreat_hash 
    end
    retreats_array
  end 
  


  def self.scrape_retreat_details(url) 
    page = Nokogiri::HTML(open(url))
    retreat_details_hash = {
      :program_name => page.css("h1.rs-program-title").text.strip, 
      :description => page.css("p.rs-program-datetime").text.strip,
      :program_date => page.css("p.rs-program-date").text.strip,
      :location => page.css("p.rs-program-location").text.strip,
      :single_price => page.css("div.rs-program-price ul li:nth-child(n+2)").text.strip,
      :double_price => page.css("div.rs-program-price ul li").first.text.strip 
    }
    retreat_details_hash 
  end   
  

end 

Scraper.scrape_homepage("https://www.swellwomen.com/portfolios/coaching-retreats/")
Scraper.scrape_retreat_details("https://www.swellwomen.com/trips/784/rote-island-surf-yoga-retreat-open-to-men-women/")

