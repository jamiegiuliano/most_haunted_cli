class MostHauntedCli::Scraper
    
    @america = []
    @states = []
    
    @url = "https://hauntedrooms.com/haunted-places"
    
    def self.get_page(url)
        html = open(url)
        Nokogiri::HTML(html)  
    end
    
    def self.america
       @america 
    end
    
    def self.states
       @states 
    end
    
    def self.url
       @url 
    end
   
    def self.scrape_america
        doc = get_page(self.url)
        new = doc.search("h3.section-title.clearfix span").children
        new.each do |list|
            self.america << list.text
        end
        self.america
    end
    
    def self.scrape_america_descriptions
        doc = get_page(self.url)
        paragraphs = doc.search("div.entry-content p")
        paragraphs
    end
    
    def self.states
       doc = get_page(self.url)
       states = doc.search("tbody li").children
        states.each do |s|
           self.states << s.text
        end
        self.states
    end
end