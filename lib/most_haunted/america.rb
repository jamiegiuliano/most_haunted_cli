class MostHauntedCli::America
    attr_accessor :location, :description
    
    @@haunted = []
    
    INDEXES = [
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
    
    def self.haunted
        @@haunted 
    end
    
    def self.indexes
        INDEXES
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