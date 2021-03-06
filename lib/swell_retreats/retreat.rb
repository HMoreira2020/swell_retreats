class SwellRetreats::Retreat 
  attr_accessor :name, :location, :dates, :price, :description, :availability, :url, :program_name, :program_date, :location, :single_price, :double_price 
  
  @@all = [] 
  
  def initialize(retreat_hash) 
    retreat_hash.each{|key, value| self.send(("#{key}="), value)}
    @@all << self 
  end 
  
  def self.create_from_collection(retreats_array) 
    retreats_array.each{|retreat| SwellRetreats::Retreat.new(retreat)}  
  end 
  
  def add_retreat_details(details_hash)
    details_hash.each{|key, value| self.send(("#{key}="), value)}
  end 
   
    
  def self.all 
    @@all
  end
  

end 


