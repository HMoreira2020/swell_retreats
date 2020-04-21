require_relative "./retreat" 
require_relative "./scraper"

class CLI 
  def call 
    puts "Welcome to Swell Women's Surf Retreats" 
    make_retreats 
    add_details_to_retreats
    list_retreats
    retreat_menu
    goodbye  
  end 
  
  def make_retreats
    retreats_array = Scraper.scrape_homepage("https://www.swellwomen.com/portfolios/coaching-retreats/") 
    Retreat.create_from_collection(retreats_array) 
  end
  
   def add_details_to_retreats #sends to retreat#add_retreat_details which needs the details_hash argument 
   puts "adding details"
    Retreat.all.each do |retreat| 
      details_hash = Scraper.scrape_retreat_details(retreat.url) #can I have retreat.url as an argument here?
      retreat.add_retreat_details(details_hash)
    end 
  end 
  
  def list_retreats 
    puts "Here are our upcoming Swell Women's Retreats:"
    Retreat.all.each.with_index(1) do |retreat, index| 
      puts ""
      puts "#{index}. #{retreat.name} - #{retreat.dates}"
      puts "" 
    end
  end

  #def list_more_details(the_retreat)
  #make listing out more details a method to call when they enter the number they want to see 
  #end 
  
  def retreat_menu  
    input = '' 
    until input == "exit" 
      puts "Type the number of retreat you'd like to see more about:"
      input = gets.strip.downcase 
      
      if input.to_i > 0 
        the_retreat = Retreat.all[input.to_i - 1]
        
        puts "Program Name: #{the_retreat.program_name}" 
        puts "Dates: #{the_retreat.program_date}" 
        puts "Location: #{the_retreat.location}" 
        puts "Description: #{the_retreat.description}"
        puts "Single-Occupancy Price: #{the_retreat.single_price}" 
        puts "Double-Occupancy Price: #{the_retreat.double_price}" 
        puts "Availability: #{the_retreat.availability}"
        puts "Would you like to see the list again? " 
      elsif input == "y" 
        list_retreats
      elsif input == "exit" || input == "n" 
        exit 
      else 
        puts "I'm not sure what you want, please enter list or exit:"
      end 
    end 
  end 
    

  def goodbye 
    puts "See you on your next Swell Retreat!" 
  end 
end

