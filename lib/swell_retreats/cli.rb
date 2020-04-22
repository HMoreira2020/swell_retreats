require_relative "./retreat" 
require_relative "./scraper"
require 'colorize' 

class CLI 
  def call 
    puts "Welcome to Swell Women's Surf Retreats!".colorize(:light_blue)  
    puts "" 
    make_retreats 
    list_retreats
    retreat_menu
    goodbye  
  end 
  
  def make_retreats
    retreats_array = Scraper.scrape_homepage("https://www.swellwomen.com/portfolios/coaching-retreats/") 
    Retreat.create_from_collection(retreats_array) 
  end
  
  def add_details_to_retreat(retreat)
      details_hash = Scraper.scrape_retreat_details(retreat.url) 
      retreat.add_retreat_details(details_hash)
  end 
  
  def list_retreats 
    puts "Here are our upcoming Swell Women's Retreats:".colorize(:light_blue)
    Retreat.all.each.with_index(1) do |retreat, index| 
      puts "    #{index}. #{retreat.name}"
      puts "       #{retreat.dates}"
      puts ""
    end
  end
  
  def retreat_menu  
    input = '' 
    until input == "exit" 
      puts "---- Enter the number of the retreat you'd like to see more about: ".colorize(:light_blue)
      puts "---- Enter 'list' to see the list again:".colorize(:light_blue)
      puts "---- Enter 'exit' to exit the program:".colorize(:light_blue)
      puts "" 
      input = gets.strip.downcase 
      
      if input.to_i > 0 
        the_retreat = Retreat.all[input.to_i - 1]
        add_details_to_retreat(the_retreat)
        show_details(the_retreat)
      elsif input == "list" 
        list_retreats
      elsif input == "exit"
        exit 
      else 
        puts "I'm not sure what you want, please enter list or exit:"
      end 
    end 
  end 
    
  def show_details(retreat) 
    puts "            Program Name:".colorize(:light_blue) 
    puts "#{retreat.program_name}" 
    puts "            Dates:".colorize(:light_blue)  
    puts "#{retreat.program_date}"
    puts "            Location:".colorize(:light_blue) 
    puts "#{retreat.location}" 
    puts "            Description:".colorize(:light_blue) 
    puts "#{retreat.description}"
    puts "            Pricing:".colorize(:light_blue)  
    puts "Single-Occupancy Price: #{retreat.single_price}" 
    puts "Double-Occupancy Price: #{retreat.double_price}" 
    puts "          Availability:".colorize(:light_blue)
    puts "              #{retreat.availability}"
    puts "" 
  end

  def goodbye 
    puts "See you on your next Swell Retreat!" 
  end 
end

