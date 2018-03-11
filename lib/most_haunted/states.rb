class MostHauntedCli::States
    attr_accessor :name, :url
    
    @@all = []
    
    def initialize(name)
       @name = name
       @@all << self
    end

    def self.create_state(array)
        array.each do |s|
            name = s
            self.new(name)
        end
        add_urls
    end
    
    def self.all
        @@all
    end
     
    def self.states_list
        self.all.collect.with_index(1){|s, i| "#{i}. #{s.name}"}
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
    
    def self.open_state_info(input)
        MostHauntedCli::Scraper.scrape_state_locations(input).each{|i| puts i.gsub(' –', '.')}
    end
    
    def self.add_urls
        u = MostHauntedCli::Scraper.urls
        self.all.each.with_index do |h, i|
            h.url = u[i]
        end
    end
end