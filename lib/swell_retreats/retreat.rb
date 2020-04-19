class SwellRetreats::Retreat 
  attr_accessor :name, :location, :dates, :price, :description, :availability 
  
  @@all = [] 
  
  def initialize(attributes)
    @@all << self 
  end 
  
  
  def self.all 
    #should retreat a bunch of instances of Retreat 
     puts <<-DOC.gsub /^\s*/,''
      1. April 19 - 25, 2020	Rote Island Surf & Yoga Retreat (open to men & women)
      2. April 19 - 23, 2020	SwellWomen Mexico Surf & Yoga April #1
    DOC
  end 
  
end 