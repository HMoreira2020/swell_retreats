class SwellRetreats::CLI 
  def call 
    puts "Welcome to Swell Women's Surf Retreats" 
    list_retreats
    retreat_menu
    goodbye  
  end 
  
  def list_retreats
    puts "Here are our upcoming Swell Women's Retreats:"
    puts <<-DOC.gsub /^\s*/,''
      1. April 19 - 25, 2020	Rote Island Surf & Yoga Retreat (open to men & women)
      2. April 19 - 23, 2020	SwellWomen Mexico Surf & Yoga April #1
    DOC
  end
      

  def retreat_menu  
    input = '' 
    until input == "exit" 
      puts "Enter which retreat you'd like to see more about or list to see the list again or type exit:"
      input = gets.chomp.downcase 
      case input 
      when "1" 
        puts "See more on retreat 1.." 
      when "2" 
        puts "see more on retreat 2..."
      when "list" 
        list_retreats 
      else 
        puts "I'm not sure what you want, please enter list or exit:" 
      end 
    end 
  end 
    

  def goodbye 
    puts "See you on your next Swell Retreat!" 
  end 
end