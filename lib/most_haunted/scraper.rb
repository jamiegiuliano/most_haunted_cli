class MostHauntedCli::Scraper
   
    def self.scrape_america
        america = []
        binding.pry
        doc = Nokogiri::HTML(open("https://www.hauntedrooms.com/haunted-places"))
        
        america
    end
    
    def self.scrape_states
        
    end
end