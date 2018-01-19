class MostHauntedCli::America
    
    def self.all
        top_ten = MostHauntedCli::Scraper.scrape_america
        all = top_ten.each{|h| h }
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

end