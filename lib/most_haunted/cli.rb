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
        MostHauntedCli::America.list_location_names
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
                puts "--" * 20
                puts MostHauntedCli::America.found(input).name
                puts "--" * 20
                puts ''
                puts "Location: #{MostHauntedCli::America.found(input).location}"
                puts ''
                MostHauntedCli::America.america_descriptions(MostHauntedCli::America.found(input).description)
            elsif input == "list"
                puts ''
                list_america
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
    
    def list_states
        MostHauntedCli::States.state_columns
    end
    
    def state_options
        input = nil
        while input != "exit"
        puts "--" * 30
            puts <<-DOC.gsub /^\s*/, ''
            
            * choose an index (1-52) to discover the state's most haunted locations!
            * 'list' for a list of states
            * 'main menu'
            * 'exit'
            
            DOC
            input= gets.strip.downcase
            
            if input.to_i.between?(1, MostHauntedCli::States.all.length)
                MostHauntedCli::States.open_state_info(input.to_i)
            elsif input == 'main menu'
                start
            elsif input == 'list'
                puts ''
                MostHauntedCli::States.state_columns
            elsif input == 'exit'
                goodbye
                exit
            else
                puts ''
                puts "** Please enter valid input **"
                state_options
            end
        end
    end
    
    def goodbye
        puts ''
        puts "Scare ya later!"
    end
end