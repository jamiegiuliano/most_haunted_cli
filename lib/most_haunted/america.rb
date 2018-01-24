class MostHauntedCli::America
    attr_accessor :location, :description
    
    @haunted = []
    @list = []
    
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
            
    def self.america_indexes
       @@indexes 
    end
    
    def self.list
       @list 
    end
    
    def self.haunted
       @haunted 
    end
    
    def self.list_each
        self.list.each{|l| puts l}
    end
  
    def self.create_haunted
        top_ten = MostHauntedCli::Scraper.scrape_america
        top_ten.each do |h|
            new = self.new
            new.location = h
            d = h.split(".")[0]
            n = "#{d}".to_i
            new.description = @@indexes[n-1]
            self.haunted << new
        end
        self.haunted
    end
    
    def self.list_haunted
       create_haunted.collect{|h| self.list << h.location}
       puts self.list
    end
    
    def self.america_descriptions(input)
        p = MostHauntedCli::Scraper.scrape_america_descriptions
        input.each do |i|
            puts p.children[i].text
            puts ""
        end
    end

end