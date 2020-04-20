require 'net/http'
require 'nokogiri' 
require 'open-uri'
require 'pry'

class SwellRetreats::Scraper 
  attr_accessor :name, :location, :dates, :description, :single_price, :double_price, :availability, :retreat_url   
  

  def self.scrape_retreat_page(sweLl_site)
    #swell_site = "https://www.swellwomen.com/portfolios/coaching-retreats/"
    page = Nokogiri::HTML(open(site))
    retreats_array = []
    page.css("div.inner").collect do |retreat| 
      retreat_hashs = {
        :name => retreat.css("td.rs-title").text,
        :dates => retreat.css("td.rs-dates").text,
        :availability => retreat.css("td.rs-availability-words").text, 
        :retreat_url => retreat.css("td.rs-show-more-link a").attribute("href")
      }
      retreats_array << retreats_hash 
    end
    retreats_array
  end 
  

  def self.scrape_retreat_details(retreat_url) 
    page = Nokogiri::HTML(open(retreat_url))
    retreat_hash = {
    :name => page.css(), 
    :location => page.css().text,
    :description => page.css().text,
    :single_price => page.css(),
    :double_price => page.css()
 
    }
  end   

end 

