class SwellRetreat::Retreat 
  attr_accessor :name, :location, :dates, :price, :description, :availability 
  
  @@all = [] 
  
  def initialize(attributes)
    @@all << self 
  end 
  
  
  def self.all 
    #should retreat a bunch of instances of Retreat 
    puts "list of all retreats" 
  end 
  
end 