class SwellRetreats::CLI 
  def call 
    puts "Welcome to Swell Women's Surf Retreats" 
    list_retreats
    retreat_menu
    goodbye  
  end 
  
  def list_retreats
    #should now iterate over Retreat.all or the return of Scraper.scrape_homepage array to puts out retreat name, dates, as the list from which the user chooses which retreat to see more about.  
    puts "Here are our upcoming Swell Women's Retreats:"
    retreats_array = Scraper.scrape_homepage("https://www.swellwomen.com/portfolios/coaching-retreats/") 
    Retreats.create_from_collection(retreats_array) 
    Retreat.all.each.with_index(1) do |retreat, index| 
      puts "#{index}. #{retreat.name} - #{retreat.dates} - #{retreat.availability}"
    end
  end
      

  def retreat_menu  
    input = '' 
    until input == "exit" 
      puts "Enter which retreat you'd like to see more about or list to see the list again or type exit:"
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
      else 
        puts "I'm not sure what you want, please enter list or exit:"
      end 
    end 
  end 
    

  def goodbye 
    puts "See you on your next Swell Retreat!" 
  end 
end