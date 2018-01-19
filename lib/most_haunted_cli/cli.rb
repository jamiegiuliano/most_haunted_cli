class MostHauntedCli::CLI
    
    #america_descriptions_indexes
        @@indexes = [
           (46..48).to_a,
           (41..44).to_a,
           (36..39).to_a,
           (32..34).to_a,
           (28..30).to_a,
           (25..26).to_a,
           (21..23).to_a,
           (17..19).to_a,
           (13..15).to_a,
           (8..11).to_a,
            ]
   
    def call
        puts "Search for Scary Places Near You!" 
        start
        goodbye
    end
    
    def start
        puts <<-DOC
        
            1. Most Haunted Places in America
            2. Choose a State
        DOC
        
        input = nil
        puts ''
        while input != "exit"
            puts "Please enter '1', '2', or 'exit'"
            puts "" 
            input = gets.strip.downcase
            
            case input
            when "1"
                puts ""
                puts "10 Most Haunted Places in America"
                puts ""
                sleep(2)
                list_america
                america_descriptions
            when "2"
                puts ""
                puts "List of States:"
            else
                goodbye
                exit
            end
        end
    end
    
    def list_america 
        puts ''
        MostHauntedCli::America.all
    end
    
    def america_descriptions
        input = nil
        while input != "exit"
            puts  <<-DOC 
            
            * Choose an index (1-10)
            * 'list' for the 10 Most Haunted Places in America
            * 'main menu'
            * 'exit'
            DOC
            input = gets.strip.downcase
            descriptions = MostHauntedCli::America
                
            if input.to_i > 0 
                descriptions.america_descriptions(@@indexes[input.to_i-1])
            elsif input == "list"
                list_america
            elsif input == "main menu"
                start
            else 
                goodbye
                exit
            end
        end
    end
    
    def goodbye
        puts "Scare ya later!"
    end
end