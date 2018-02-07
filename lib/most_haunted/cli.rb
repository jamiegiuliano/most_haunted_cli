class MostHauntedCli::CLI
   
    def initialize
        MostHauntedCli::Scraper.scrape_america
    end
    
    def call
        puts "--" * 17
        puts "Search for Scary Places Near You!" 
        puts "--" * 17
        start
        goodbye
    end
    
    def start
        puts ''
        puts <<-DOC.gsub /^\s*/, ''
        
            1. Most Haunted Places in America
            2. Choose a State
        DOC
        
        input = nil
        puts ''
        while input != "exit"
            puts "--" * 17
            puts "Please enter '1', '2', or 'exit'"
            puts "" 
            input = gets.strip.downcase
            
            case input
            when "1"
                puts "--" * 17
                puts "10 Most Haunted Places in America"
                puts "--" * 17
                puts ""
                sleep(2)
                list_america
                america_descriptions
            when "2"
                puts ""
                puts "COMING SOON!"
            when "exit"
                goodbye
                exit
            else
                puts ''
                puts "** Please enter valid input **"
                start
            end
        end
    end
    
    def list_america 
        puts ''
        MostHauntedCli::America.list_locations_names
    end
    
    def america_descriptions
        input = nil
        while input != "exit"
            puts "--" * 30
            puts  <<-DOC.gsub /^\s*/, ''
            
            * choose an index (1-10) for more information on a location
            * 'list' for the 10 Most Haunted Places in America
            * 'main menu' 
            * 'exit'
            DOC
            input = gets.strip.downcase
                
            if input.to_i.between?(1, MostHauntedCli::America.all.size)
                puts ''
                puts "Location: #{MostHauntedCli::America.all[input.to_i].location}"
                puts ''
                MostHauntedCli::America.america_descriptions(MostHauntedCli::America.find_description_by_input(input))
            elsif input == "list"
                puts ''
                MostHauntedCli::America.list_locations_names
            elsif input == "main menu"
                start
            elsif input == 'exit' 
                goodbye
                exit
            else
                puts ''
                puts "** Please enter valid input **" 
                america_descriptions
            end
        end
    end
    
    def goodbye
        puts ''
        puts "Scare ya later!"
    end
end