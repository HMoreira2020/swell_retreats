class SwellRetreats::Retreat 
  attr_accessor :name, :location, :dates, :price, :description, :availability, :url 
  
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
  
  retreat_1 = self.new 
  retreat_1.name = "" 
  retreat_1.price = "$2" 
  retreat_1.availability = "open" 
  retreat_1.location = "costa rica"
  retreat_1.description = "amazing!" 
  retreat_1.dates = "may 4 - 10" 
  retreat_1.url = "https://www.swellwomen.com/trips/726/rote-island-surf-yoga-retreat-open-to-men-women/"
  
  [retreat_1] 
  end 
end 