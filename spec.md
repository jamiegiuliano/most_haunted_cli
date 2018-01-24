# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
    - MostHauntedCli::CLI allows interaction with the user.
    On start of the app the User is presented with a choice to view either
    the 10 Most Haunted locations in America and further explore their 
    descriptions or view a list of states, where they will be able to 
    further choose and individual state's list of most haunted locations and
    their descriptions as well.
     
    - In each menu, the User is also presented with other options such as, 
    'main menu', 'list', or 'exit' to help navigate through the app smoothly.
     
- [x] Pull data from an external source
    - A list of the 10 Most Haunted locations in America | list of states with haunted
    locations, and their descriptions are all scraped from:
    https://www.hauntedrooms.com/haunted-places
      
- [x] Implement both list and detail views
- The Scraper presents the User with a list of either:
    - the 10 Most Haunted locations in America
        - Here the User has the option to go further into the descriptions of a 
        location or can go back to 'main menu'
       
    - A list of States with haunted locations
        (COMING SOON)
        - Here the User has the option to choose a state to see the top
        haunted locations in that area
            - Can choose one of the locations to receive a further description