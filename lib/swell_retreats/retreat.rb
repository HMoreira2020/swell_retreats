class Retreat 
  attr_accessor :name, :location, :dates, :price, :description, :availability, :url, :program_name, :program_date, :locati:single_price, :double_price 
  
  @@all = [] 
  
  def initialize(retreat_hash) 
    retreat_hash.each{|key, value| self.send(("#{key}="), value)}
    @@all << self 
  end 
  
  def self.create_from_collection(retreats_array) 
    retreats_array.each{|retreat| Retreat.new(retreat_hash)}  #which sends it to initialize where each key/value pair is assigned as the objects attributes, AND it adds it to the @@all array so all retreat objects are in @@all. make sure the attr_accessors match} 
  end 
  
  def self.see_more_details(attributes_hash)
    retreat_hash = results from Scraper.scrape_retreat_details #which is a hash of key/values representing the retreats info 
    iterate over the retreat hash and 
    puts "retreat_details_hash[:program_name]" 
    puts "retreat_details_hash[:accomodations]"
    puts "retreat_details_hash[:description]"
    puts "retreat_details_hash[:single_price]"
    puts "retreat_details_hash[:double_price]"
    #retreat_hash.each do |key, value| self.send(("#{key}:"), value)}
  end 
  
  def self.all 
    @@all
  end
  
  
   
  #scrape SwellWomen site and return retreats based on that data 
  # retreat_1 = self.new
  # retreat_1.name = "shortboard" 
  # retreat_1.price = "$2" 
  # retreat_1.availability = "open" 
  # retreat_1.location = "costa rica"
  # retreat_1.description = "amazing!" 
  # retreat_1.dates = "may 4 - 10" 
  # retreat_1.url = "https://www.swellwomen.com/trips/726/rote-island-surf-yoga-retreat-open-to-men-women/"
  
  # retreat_2 = self.new 
  # retreat_2.name = "longboard" 
  # retreat_2.price = "$3" 
  # retreat_2.availability = "open" 
  # retreat_2.location = "costa rica"
  # retreat_2.description = "stellar!" 
  # retreat_2.dates = "may 20 - 24" 
  # retreat_2.url = "https://www.swellwomen.com/trips/726/rote-island-surf-yoga-retreat-open-to-men-women/"
  

end 
