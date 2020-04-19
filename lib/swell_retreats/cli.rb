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
    @retreats.each.with_index(1) do |retreat, index| 
      puts "#{index}. #{retreat.name} - #{retreat.dates} - #{retreat.price} - #{retreat.description}"
    end
  end
      

  def retreat_menu  
    input = '' 
    until input != "exit" 
      puts "Enter which retreat you'd like to see more about or list to see the list again or type exit:"
      input = gets.strip.downcase 
      
      if input.to_i > 0 
        the_retreat = @retreats[input.to_i - 1]
        puts "#{the_retreat.name} - #{the_retreat.dates} - #{the_retreat.price} - #{the_retreat.description}"
      elsif input == "list" 
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