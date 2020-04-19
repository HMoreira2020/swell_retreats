class SwellRetreats::CLI 
  def call 
    puts "Welcome to Swell Women's Surf Retreats" 
    list_retreats
    retreat_menu
    goodbye  
  end 
  
  def list_retreats
    puts "Here are our upcoming Swell Women's Retreats:"
    @retreats = SwellRetreats::Retreat.all 
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