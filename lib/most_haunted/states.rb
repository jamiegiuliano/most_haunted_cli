class MostHauntedCli::States
    attr_accessor :name, :url
    
    @@haunted = []
    @@states = []
    
    def initialize(name)
       @name = name
       @@haunted << self
    end

    def self.create_state(array)
        array.each do |s|
            name = s
            self.new(name)
        end
        add_urls
    end
    
    def self.haunted
        @@haunted
    end
    
    def self.states
        @@states
    end
     
    def self.states_list
        self.haunted.collect.with_index(1){|s, i| "#{i}. #{s.name}"}
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
        states_list.each.each_slice(2) do |slice|
            create_columns(slice)
        end
    end
    
    # Individual State Information
    
    def self.open_state_title(input)
       title = MostHauntedCli::Scraper.scrape_state_title(input)
       puts title
    end
    
    def self.open_state_info(input)
        info = MostHauntedCli::Scraper.scrape_state_locations(input)
        info.each{|i| puts i.gsub(' –', '.')}
    end
    
    def self.add_urls
        u = MostHauntedCli::Scraper.scrape_state_url
        self.haunted.each.with_index do |h, i|
            h.url = u[i]
        end
    end
end