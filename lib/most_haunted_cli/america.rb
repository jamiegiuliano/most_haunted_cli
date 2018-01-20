class MostHauntedCli::America
    attr_accessor :location
    
    @america = []
    
    def self.all_america
       @america 
    end
  
    def self.all_haunted
        top_ten = MostHauntedCli::Scraper.scrape_america
        all = top_ten.each{|h|
            new = self.new
            new.location = h
            @america << new}
        puts all
        all.clear
    end
    
    def self.america_descriptions(input)
        p = MostHauntedCli::Scraper.scrape_america_descriptions
        input.each do |i|
            puts p.children[i].text
            puts ""
        end
    end
    
    def connect_descriptions
        
    end

end