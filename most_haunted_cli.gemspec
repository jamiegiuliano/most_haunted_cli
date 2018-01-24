require './lib/most_haunted_cli/version'

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "most_haunted_cli/version"

Gem::Specification.new do |spec|
  spec.name          = "most_haunted_cli"
  spec.version       = MostHauntedCli::VERSION
  spec.authors       = ["jamiegiuliano"]
  spec.email         = ["jamiepgiuliano@gmail.com"]

  spec.summary       = "Most Haunted Places in America"
  spec.description   = "Top 10 Haunted Locations in America and Top Haunted Locations in Every State."
  spec.homepage      = "https://github.com/jamiegiuliano/most_haunted_cli"
  spec.license       = "MIT"
  
  spec.executables   = ["most_haunted_cli"]
  spec.files         = ["lib/most_haunted_cli", "lib/most_haunted_cli/america.rb", "lib/most_haunted_cli/cli.rb", "lib/most_haunted_cli/scraper.rb", "lib/most_haunted_cli/states.rb", "lib/most_haunted_cli/version.rb", "lib/most_haunted.rb"]
 
 
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
  
  spec.add_dependency "nokogiri", ">= 0"
end
