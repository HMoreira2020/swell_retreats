require_relative "./retreat" 
require_relative "./scraper"

class CLI 
  def call 
    puts "Welcome to Swell Women's Surf Retreats" 
    make_retreats 
    list_retreats
    retreat_menu
    goodbye  
  end 
  
  def make_retreats
    retreats_array = Scraper.scrape_homepage("https://www.swellwomen.com/portfolios/coaching-retreats/") 
    Retreat.create_from_collection(retreats_array) 
  end
  
  def list_retreats 
    puts "Here are our upcoming Swell Women's Retreats:"
    Retreat.all.each.with_index(1) do |retreat, index| 
      puts "#{index}. #{retreat.name} - #{retreat.dates} - #{retreat.availability}"
    end
  end

  def add_details_to_retreats #sends to retreat#add_retreat_details which needs the details_hash argument 
    Retreat.all.each do |retreat| 
      details_hash = Scraper.scrape_retreat_details(retreat.url) #can I have retreat.url as an argument here?
      retreat.add_retreat_details(details_hash)
    end 
  end 
  
  
  def retreat_menu  
    input = '' 
    until input == "exit" 
      puts "Menu options:" 
      puts "Type the number of retreat you'd like to see more about"
      puts "Type 'list' to see the list again" 
      puts "exit" 
      input = gets.strip.downcase 
      
      if input.to_i > 0 
        the_retreat = Retreat.all[input.to_i - 1]
        #build Retreat#add_more_details method to add these attributes to each retreat object 
        puts "#{the_retreat.program_name}" 
        puts "#{the_retreat.program_date}" 
        puts "#{the_retreat.location}" 
        puts "#{the_retreat.description}"
      elsif input == "list" 
        list_retreats
      elsif input == "exit"
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