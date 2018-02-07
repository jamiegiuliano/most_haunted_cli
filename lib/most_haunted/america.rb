class MostHauntedCli::America
    attr_accessor :name, :location, :description
    
    @@all = []
    
    INDEXES = [
        (46..48),
        (41..44),
        (36..39),
        (32..34),
        (28..30),
        (25..26),
        (21..23),
        (17..19),
        (13..15),
        (8..11),
         ]
    
    def initialize(name, location, description)
        @name = name
        @location = location
        @description = description
        @@all << self
    end
  
    def self.create(array)
        array.each do |h|
            array = h.split(",", 2)
            name = array[0]
            location = array[1]
            d = h.split(".")[0].to_i
            description = indexes[d-1]
            self.new(name, location, description)
        end
    end
    
    def self.all
        @@all 
    end
    
    def self.indexes
        INDEXES.each{|range| (range).to_a }
    end
    
    def self.list_locations_names
        self.all.each{|l| puts "#{l.name}"}
    end
    
    def self.america_descriptions(input)
        input.each do |i|
            description = MostHauntedCli::Scraper.scrape_america_descriptions.children[i].text
            puts description.scan(/.{1,73}/).join("\n")
            puts ""
        end
    end

end