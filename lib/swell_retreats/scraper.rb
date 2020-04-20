require 'net/http'
require 'nokogiri' 
require 'open-uri'
require 'pry'

class SwellRetreats::Scraper
  attr_accessor :name, :location, :dates, :description, :single_price, :double_price, :availability, :url 
  
 
  def self.scrape_homepage(site)
    #swell_site = "https://www.swellwomen.com/portfolios/coaching-retreats/"
    page = Nokogiri::HTML(open(site))
    retreats_array = []
    page.css("div.inner").collect do |retreat| 
      retreats_hash = {
        :name => retreat.css("td.rs-title").text,
        :dates => retreat.css("td.rs-dates").text,
        :availability => retreat.css("td.rs-availability-words").text, 
        :retreat_url => retreat.css("td.rs-show-more-link a").attribute("href")
      }
      retreats_array << retreats_hash 
    end
    retreats_array
  end 
  
  
  
#scrapes a retreats page and creates a hash of retreat_details 
  def self.scrape_retreat_details(retreat_url) 
    page = Nokogiri::HTML(open(retreat_url))
    retreat_details_hash = {}
    retreat_details_hash[:program_name]= page.css(), 
    retreat_details_hash[:accomodations] = page.css().text,
    retreat_details_hash[:description] = page.css().text,
    retreat_details_hash[:single_price] = page.css(),
    retreat_details_hash[:double_price] = page.css()
    }
    retreat_details_hash 
  end   
  

end 

