$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "synchro/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "synchro"
  s.version     = Synchro::VERSION
  s.authors     = ["Ivan Kuznetsov"]
  s.email       = ["me@jeiwan.ru"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Synchro."
  s.description = "TODO: Description of Synchro."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails"
  s.add_development_dependency "rspec-rails", "~> 3.2.1"
end
