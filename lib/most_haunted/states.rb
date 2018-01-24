class MostHauntedCli::States
    attr_accessor :name
    
    @haunted = []
    @states = []

    def self.create_state
        states = MostHauntedCli::Scraper.states
        states.each do |s|
           new = self.new
           new.name = s
           @haunted << new
        end
        self.haunted
    end
    
    def self.haunted
        @haunted
    end
    
    def self.states
        @states
    end
     
    def self.states_list
        if self.states.empty? == true
            create_state.collect.with_index(1) do |s, i| 
               self.states << "#{i}. #{s.name}"
            end
        end
    end
    
    def self.create_columns(slice)
        l = slice[0].length
        if l >= 24
            puts "#{slice[0]}"+"      "+"#{slice[1]}"
        else
            puts "#{slice[0]}"+" " * (30 - l)+"#{slice[1]}"
        end 
    end
    
    def self.state_columns
        self.states.each.each_slice(2) do |slice|
            create_columns(slice)
        end
    end
end