class MostHauntedCli::America
    attr_accessor :location, :description
    
    @haunted = []
    @k = 0 
    
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
            
    def self.america_indexes
       @@indexes 
    end

    def self.list
        @list.each{|l| puts l}
    end
  
    def self.create_haunted
        top_ten = MostHauntedCli::Scraper.scrape_america
        top_ten.each.with_index do |h, i|
            new = self.new
            new.location = h
            d = h.split(".")[0]
            n = "#{d}".to_i
            new.description = @@indexes[n-1]
            @haunted << new
        end
        @haunted
    end
    
    def self.list_haunted
       @list = []
       create_haunted.collect{|h| @list << h.location}
       puts @list
    end
    
    def self.list
        @list.each{|l| puts l}
    end
    
    def self.america_descriptions(input)
        p = MostHauntedCli::Scraper.scrape_america_descriptions
        input.each do |i|
            puts p.children[i].text
            puts ""
        end
    end

end