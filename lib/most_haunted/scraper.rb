class MostHauntedCli::Scraper
    
    @@america = []
    
    URL = "https://hauntedrooms.com/haunted-places"
    
    def self.america
        @@america 
    end
   
    def self.scrape_america
        doc = Nokogiri::HTML(open(URL))
        list = doc.search("h3.section-title span").children
        list.each do |l|
            self.america << l.text.strip
        end
        MostHauntedCli::America.create(self.america)
    end
    
    def self.scrape_america_descriptions
        doc = Nokogiri::HTML(open(URL))
        paragraphs = doc.search("div.entry-content p")
        paragraphs
    end
end