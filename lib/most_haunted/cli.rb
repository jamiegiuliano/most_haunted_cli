class MostHauntedCli::CLI
   
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
                list_states
                state_options
            else
                goodbye
                exit
            end
        end
    end
    
    def list_america 
        puts ''
        MostHauntedCli::America.list_haunted
    end
    
    def list_states
      MostHauntedCli::States.states_list 
      puts ''
    end
    
    def state_options
        input = nil
        while input != "exit"
            puts <<-DOC.gsub /^\s*/, ''
            
            * choose an index (1-52) to discover a state's most haunted location!
            * 'main menu'
            * 'exit'
            
            DOC
            input= gets.strip.downcase
            
            if input.to_i > 0
                puts ''
                puts "MORE GHOSTS COMING SOON"
                puts ''
            elsif input == 'main menu'
                start
            else
                goodbye
                exit
            end
        end
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
            descriptions = MostHauntedCli::America
                
            if input.to_i > 0 
                descriptions.america_descriptions(MostHauntedCli::America.america_indexes[input.to_i-1])
            elsif input == "list"
                MostHauntedCli::America.list
            elsif input == "main menu"
                start
            else 
                goodbye
                exit
            end
        end
    end
    
    def goodbye
        puts ''
        puts "Scare ya later!"
    end
end