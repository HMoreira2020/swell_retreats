require 'net/http'
require 'nokogiri' 
require 'open-uri'
require 'pry'

class SwellRetreats::Scraper 
  attr_accessor :name, :location, :dates, :description, :price, :availability, :url   
  

  def self.scrape_home_page(site)
    #site = "https://www.swellwomen.com/portfolios/coaching-retreats/"
    page = Nokogiri::HTML(open(site))
    retreats_array = 
    binding.pry 
  
    page.css("div.inner").collect do |retreat| 
      retreat_hash = {
        :name => retreat.css("td.rs-title").text,
        :dates => retreat.css("td.rs-dates").text,
        :availability => retreat.css("td.rs-availability-words").text, 
        :url => retreat.css("td.rs-show-more-link a").attribute("href")
      }
      retreats_array << retreat_hash 
    end
    retreats_array
  end 
  
end 

:price => retreat.css(),
:location => retreat.css().text, 
:description => retreat.css().text,

