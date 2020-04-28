require 'colorize' 

class SwellRetreats::CLI 
  def call 
    puts "          Welcome to Swell Women's Surf Retreats!".colorize(:light_blue) 
    puts "Our Boutique Surf & Yoga Retreats are designed to introduce you to our coaching"
    puts "philosophies while our intensive Wellness Retreats offer a heavy emphasis on"
    puts "wellness and personalized goal-setting and guidance." 
    puts "" 
    make_retreats 
    list_retreats
    retreat_menu
    goodbye  
  end 
  
  def make_retreats
    retreats_array = SwellRetreats::Scraper.scrape_homepage("https://www.swellwomen.com/portfolios/coaching-retreats/") 
    SwellRetreats::Retreat.create_from_collection(retreats_array) 
  end
  
  def add_details_to_retreat(retreat)
      details_hash = SwellRetreats::Scraper.scrape_retreat_details(retreat.url) 
      retreat.add_retreat_details(details_hash)
  end 
  
  def list_retreats 
    puts "Here are our upcoming Swell Women's Retreats:".colorize(:light_blue)
    SwellRetreats::Retreat.all.each.with_index(1) do |retreat, index| 
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
        the_retreat = SwellRetreats::Retreat.all[input.to_i - 1]
        add_details_to_retreat(the_retreat)
        show_details(the_retreat)
      elsif input == "list" 
        list_retreats
      else 
        puts "I'm not sure what you want, please enter one of the following:".colorize(:red) unless input == "exit"
      end 
    end 
  end 
    
  def show_details(retreat) 
    puts "            Program Name:".colorize(:light_blue) 
    puts "#{retreat.program_name}" 
    puts "            Dates:".colorize(:light_blue)  
    puts "#{retreat.program_date}"
    puts "            Location:".colorize(:light_blue) 
    retreat.location.nil? ? (puts "See website for location information."):(puts "#{retreat.location}")
    puts "            Description:".colorize(:light_blue) 
    puts "#{retreat.description}"
    puts "            Pricing:".colorize(:light_blue)  
    puts "Single-Occupancy Price: #{retreat.single_price}" 
    puts "Double-Occupancy Price: #{retreat.double_price}" 
    puts "          Availability:".colorize(:light_blue)
    puts "              #{retreat.availability}"
    puts "            Website:".colorize(:light_blue)
    puts "#{retreat.url}"
    puts "" 
  end

  def goodbye 
    puts "See you on your next Swell Retreat!" 
  end 
end

