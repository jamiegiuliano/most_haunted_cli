class MostHauntedCli::CLI
   
    def call
        #puts "Search for Scary Places Near You!" 
        #start
        #goodbye
    end
    
    def open_me
        doc = Nokogiri::HTML(open("https://www.hauntedrooms.com/haunted-places")) 
        binding.pry
        doc
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
                list_america
                america_descriptions
            when "2"
                puts ""
                puts "List of States:"
            when "list"
                start
            else
                puts ""
                puts "Not sure what you're looking for, please enter 'list' or 'exit'."
            end
        end
    end
    
    def list_america 
        puts ''
        @america = MostHauntedCli::America.all
        @america.each.with_index(1) do |city, i|
            puts "#{i}. #{city.name}"
        end
    end
    
    def america_descriptions
        input = nil
        while input != "main menu"
            puts  <<-DOC 
            
            * Choose an index (1-10)
            * 'list' for the 10 Most Haunted Places in America
            * 'main menu'
            DOC
            input = gets.strip.downcase
            
            if input.to_i > 0 
                puts @america[input.to_i-1].description
                puts ""
            elsif input == "list"
                list_america
            elsif input == "main menu"
                start
            else
                puts ""
                puts "Not sure what you're looking for, please enter '1-10' or 'main menu'." 
             end
        end
    end
    
    def goodbye
        puts "Scare ya later!"
    end
end