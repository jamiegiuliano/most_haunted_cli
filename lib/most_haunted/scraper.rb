class MostHauntedCli::Scraper
    
    @america = []
    @states = []
    
    @url = "https://hauntedrooms.com/haunted-places"
    
    def self.america
       @america 
    end
   
    def self.scrape_america
        doc = Nokogiri::HTML(open(@url))
        new = doc.search("h3.section-title.clearfix span").children
        new.each do |list|
            self.america << list.text
        end
        self.america
    end
    
    def self.scrape_america_descriptions
        doc = Nokogiri::HTML(open(@url))
        paragraphs = doc.search("div.entry-content p")
        paragraphs
    end
    
    def self.states
       doc = Nokogiri::HTML(open(@url))
       states = doc.search("tbody li").children
        states.each do |s|
           @states << s.text
        end
        @states
    end
end