require 'net/http'
require 'nokogiri' 
require 'open-uri'
require 'pry'

class Scraper
  attr_accessor :name, :location, :dates, :description, :single_price, :double_price, :availability, :url 
  
 
  def self.scrape_homepage(site)
    #swell_site = "https://www.swellwomen.com/portfolios/coaching-retreats/"
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
      binding.pry 
    end
    retreats_array
  end 
  
  self.scrape_homepage("https://www.swellwomen.com/portfolios/coaching-retreats/")
  
#scrapes a retreats page and creates a hash of retreat_details 
  def self.scrape_retreat_details(retreat_url) 
    page = Nokogiri::HTML(open(retreat_url))
    retreat_details_hash = {}
    retreat_details_hash[:program_name]= page.css(), 
    retreat_details_hash[:accomodations] = page.css().text,
    retreat_details_hash[:description] = page.css().text,
    retreat_details_hash[:single_price] = page.css(),
    retreat_details_hash[:double_price] = page.css()
    retreat_details_hash 
  end   
  

end 

