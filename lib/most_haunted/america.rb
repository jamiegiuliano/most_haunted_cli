class MostHauntedCli::America
    attr_accessor :location, :description
    
    @@haunted = []
    
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
    
    def initialize(location, description)
        @location = location
        @description = description
        @@haunted << self
    end
  
    def self.create(array)
        array.each do |h|
            location = h
            d = h.split(".")[0].to_i
            description = INDEXES[d-1]
            self.new(location, description)
        end
    end
    
    def self.indexes    
        INDEXES.each{|i| puts ("#{i}".to_a)}
    end
    
    def self.haunted
        @@haunted 
    end
    
    def self.list_locations
        self.haunted.each{|l| puts l.location}
    end
    
    def self.america_descriptions(input)
        input.each do |i|
            description = MostHauntedCli::Scraper.scrape_america_descriptions.children[i].text
            puts description.scan(/.{1,73}/).join("\n")
            puts ""
        end
    end

end