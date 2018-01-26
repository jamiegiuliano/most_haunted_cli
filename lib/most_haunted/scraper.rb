class MostHauntedCli::Scraper
    
    @america = []
    @states = []
    @urls = []
    
    @main_url = "https://hauntedrooms.com/haunted-places"
    
    def self.america
       @america 
    end
   
    def self.scrape_america
        doc = Nokogiri::HTML(open(@main_url))
        new = doc.search("h3.section-title.clearfix span").children
        new.each do |list|
            self.america << list.text
        end
        self.america
    end
    
    def self.scrape_america_descriptions
        doc = Nokogiri::HTML(open(@main_url))
        paragraphs = doc.search("div.entry-content p")
        paragraphs
    end
    
    def self.states
       doc = Nokogiri::HTML(open(@main_url))
       states = doc.search("tbody li").children
        states.each do |s|
           @states << s.text
        end
        @states
    end
    
    # Individual State Information
    
    def self.scrape_state_url
        doc = Nokogiri::HTML(open(@main_url))
        states = doc.search("tbody li").children
        states.each do |s|
            @urls << s.attribute("href").value
        end
        @urls
    end
    
    def self.scrape_state_title(input)
        title = []
        u = MostHauntedCli::States.haunted
        url = u[input - 1].url
        doc = Nokogiri::HTML(open(url)) 
        t = doc.search("h1.entry-title").text
            title << t
            title
    end
    
    def self.scrape_state_locations(input)
        list = []
        u = MostHauntedCli::States.haunted
        url = u[input.to_i - 1].url
            doc = Nokogiri::HTML(open(url)) 
            locations = doc.search("div.entry-content h2").children
            if locations.empty? == true
                locations = doc.search("div.entry-content i").children
                if locations.empty? == true
                    locations = doc.search("h3.section-title.clearfix.title_center").children
                end
            end
            locations.each do |l|
                list << l.text.gsub("end section_title", " ") unless l.text == "(Stay Here)" || l.text == "(Book Now)" || l.text == "(Book a Room)"
            end
        list
    end
end