class SwellRetreats::CLI 
  def call 
    puts "Welcome to Swell Women's Surf Retreats" 
    list_retreat
    list_of_retreats
    goodbye 
  end 
  
  def list_retreat 
    puts "Here are our upcoming Swell Women's Retreats:"
    puts <<-DOC.gsub /^\s*/,''
      1. April 19 - 25, 2020	Rote Island Surf & Yoga Retreat (open to men & women)
      2. April 19 - 23, 2020	SwellWomen Mexico Surf & Yoga April #1
    DOC
  end
      

  def list_of_retreats 
    puts "Enter which retreat you'd like to know more about or type exit:"
    input = '' 
    until input = "exit" 
      input = gets.chomp.downcase 
      case input 
      when "1" 
        puts "See more on retreat 1.." 
      when "2" 
        puts "see more on retreat 2..."
      end 
    end 
  end 
    

  def goodbye 
    puts "See you on your next Swell Retreat!" 
  end 
end