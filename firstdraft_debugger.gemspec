$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "firstdraft_debugger/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "firstdraft_debugger"
  s.version     = FirstdraftDebugger::VERSION
  s.authors     = ["Murugan"]
  s.email       = ["murugu2012@gmail.com"]
  s.homepage    = "https://github.com/firstdraft"
  s.summary     = "Debug helper"
  s.description = "Firstdraft Debug Helper"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.2"

  s.add_dependency "better_errors"
  s.add_dependency "web-console"

end
