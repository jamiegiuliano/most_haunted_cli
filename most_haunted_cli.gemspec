require './lib/most_haunted/version'

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
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", ">= 0"
  s.add_development_dependency "pry", ">= 0"
  
  s.add_dependency "nokogiri", ">= 0"
end
