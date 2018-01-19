class MostHauntedCli::America
        attr_accessor :name, :location, :description
    
    def self.all
        scarries = []
        # Should return the 10 Most Haunted Places in America after Scraping website
        scary_1 = self.new
        scary_1.name = "Eastern State Penitentiary"
        scary_1.location = "Philadelphia, PA"
        scary_1.description =   "Eastern State Penitentiary brings a close to our list of the scariest 
                                places in America. Built in 1829, this former prison was a place you 
                                really didn’t want to be locked up in if you were a criminal. Originally
                                built to house up to 25o inmates, the numbers eventually swelled to over 
                                1,700. Prisoners were brutally mistreated, often sprayed with freezing 
                                cold water and sent outside in the middle of winter."
                                
        
        scary_2 = self.new
        scary_2.name = "VILLISCA AX MURDER HOUSE"
        scary_2.location = "Iowa"
        scary_2.description = "No. 2 on our list of the most haunted places in 
        the US is Villisca Axe Murder House. Widely regarded by many paranormal 
        experts as the most haunted house in America."
        
        scarries << scary_1
        scarries << scary_2
        scarries
    end

end