
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "steam_deals_cli/version"

Gem::Specification.new do |spec|
  spec.name          = "steam_deals_cli"
  spec.version       = SteamDealsCli::VERSION
  spec.authors       = ["hmelo1"]
  spec.email         = ["heriberto@melo.nyc"]

  spec.summary       = "Pull deals and sales off SteamDB"
  spec.description   = "Pull prices, sales, video game names, and daily deals off Steam DB"
  spec.homepage      = "https://github.com/hmelo1/steam_deals_cli.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
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
  spec.add_development_dependency "pry",  '~> 0.11.3'
  spec.add_development_dependency "rspec", '~> 3.7'

  spec.add_development_dependency "nokogiri", '~> 1.8', '>= 1.8.1'
  spec.add_development_dependency "open_uri_redirections", '~> 0.2.1'
end
