class SwellRetreats::Retreat 
  attr_accessor :name, :location, :dates, :price, :description, :availability, :retreat_url 
  
  @@all = [] 
  
  def initialize(retreat_hash) 
    retreat_hash.each{|key, value| self.send(("#{key}="), value)}
    @@all << self 
  end 
  
  
  def self.all 
    @@all
    #this will have to call the scrape_home_page method to work
  end
   
  #scrape SwellWomen site and return retreats based on that data 
  retreat_1 = self.new 
  retreat_1.name = "shortboard" 
  retreat_1.price = "$2" 
  retreat_1.availability = "open" 
  retreat_1.location = "costa rica"
  retreat_1.description = "amazing!" 
  retreat_1.dates = "may 4 - 10" 
  retreat_1.url = "https://www.swellwomen.com/trips/726/rote-island-surf-yoga-retreat-open-to-men-women/"
  
  retreat_2 = self.new 
  retreat_2.name = "longboard" 
  retreat_2.price = "$3" 
  retreat_2.availability = "open" 
  retreat_2.location = "costa rica"
  retreat_2.description = "stellar!" 
  retreat_2.dates = "may 20 - 24" 
  retreat_2.url = "https://www.swellwomen.com/trips/726/rote-island-surf-yoga-retreat-open-to-men-women/"
  

  
end 