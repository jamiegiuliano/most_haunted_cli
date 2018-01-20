class MostHauntedCli::Scraper
    
    @america = []
    
    def self.america
       @america 
    end
   
    def self.scrape_america
        doc = Nokogiri::HTML(open("https://hauntedrooms.com/haunted-places"))
        new = doc.search("h3.section-title.clearfix span").children
        new.each do |list|
            self.america << list.text
        end
        self.america
    end
    
    def self.scrape_america_descriptions
        doc = Nokogiri::HTML(open("https://hauntedrooms.com/haunted-places"))
        paragraphs = doc.search("div.entry-content p")
        paragraphs
    end
    
    def scrape_states
        
    end
end