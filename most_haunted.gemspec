require './lib/most_haunted/version'

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "most_haunted/version"

Gem::Specification.new do |spec|
  spec.name          = "most_haunted"
  spec.version       = MostHauntedCli::VERSION
  spec.authors       = ["jamiegiuliano"]
  spec.email         = ["jamiepgiuliano@gmail.com"]

  spec.summary       = "Most Haunted Places in America"
  spec.description   = "Top 10 Haunted Locations in America and Top Haunted Locations in Every State."
  spec.homepage      = "https://github.com/jamiegiuliano/most_haunted_cli"
  spec.license       = "MIT"
  
  spec.executables   = ["most_haunted"]
  spec.files         = ["lib/most_haunted", "lib/most_haunted/america.rb", "lib/most_haunted/cli.rb", "lib/most_haunted/scraper.rb", "lib/most_haunted/states.rb", "lib/most_haunted/version.rb", "lib/environment.rb"]
 
 
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0"
  
  spec.add_dependency "nokogiri", '>= 1.8.1'
end
