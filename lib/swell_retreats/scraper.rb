require 'net/http'
require 'nokogiri' 
require 'open-uri'
require 'pry'

class SwellRetreats::Scraper 
  attr_accessor :name, :location, :dates, :description, :price, :availability, :url   
  

  def self.scrape_home_page(site)
    site = "https://www.swellwomen.com/portfolios/coaching-retreats/"
    page = Nokogiri::HTML(open(site))
    retreats_array = []
  
    page.css("div.inner").collect do |retreat| 
      retreat_hash = {
        :name => retreat.css("td.rs-title").text,
        :location => retreat.css().text, 
        :dates => retreat.css().text,
        :price => retreat.css(),
        :description => retreat.css().text,
        :availability => retreat.css().text, 
        :url => retreat.css().text,
      }
      retreats_array << retreat_hash 
    end
    retreats_array
  end 
  
end 


