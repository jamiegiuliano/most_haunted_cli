class MostHauntedCli::Scraper
   
    def self.scrape_america
        america = []
        doc = Nokogiri::HTML(open("https://hauntedrooms.com/haunted-places"))
        binding.pry
        america
    end
    
    def self.scrape_states
        
    end
end