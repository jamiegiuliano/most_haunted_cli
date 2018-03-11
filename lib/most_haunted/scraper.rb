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
<<<<<<< HEAD
end
=======
    
     # Individual State Information
     
    def self.all_states
        @@states
    end
    
    def self.urls
       @@urls 
    end
    
    def self.states
        doc = Nokogiri::HTML(open(URL))
        states = doc.search("tbody li").children
        states.each do |t|
            self.all_states << t.text
            self.urls << t.attribute("href").value
        end
        MostHauntedCli::States.create_state(self.all_states)
    end
    
    def self.scrape_state_locations(input)
        list = []
        title = []
        u = MostHauntedCli::States.all
        url = u[input.to_i - 1].url
            doc = Nokogiri::HTML(open("https://hauntedrooms.com"+"#{url}")) 
            
            t = doc.search("h1.entry-title").text.strip
            title << t
            
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
        puts "--" * 20    
        puts title
        puts "--" * 20
        puts ''
        list
    end
end#
>>>>>>> origin/states_feature
