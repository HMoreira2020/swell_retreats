require_relative "../swell_retreats/scraper.rb"
class Retreat 
  attr_accessor :name, :location, :dates, :price, :description, :availability, :url, :program_name, :program_date, :location, :single_price, :double_price 
  
  @@all = [] 
  
  def initialize(retreat_hash) 
    retreat_hash.each{|key, value| self.send(("#{key}="), value)}
    @@all << self 
  end 
  
  def self.create_from_collection(retreats_array) 
    retreats_array.each{|retreat| Retreat.new(retreat)}  
    #which sends it to initialize where each key/value pair is assigned as the objects attributes, AND adds the retreat to @@all array so all retreat objects are in @@all. make sure the attr_accessors match
  end 
  
  def see_more_details(attributes_hash)
    #attribute_hash = results from Scraper.scrape_retreat_details 
    attribute_hash.each{|key, value| self.send(("#{key}="), value)}
  end 
  
  def self.all 
    @@all
  end
  


end 

retreats_array = Scraper.scrape_homepage("https://www.swellwomen.com/portfolios/coaching-retreats/")
Retreat.create_from_collection(retreats_array)
