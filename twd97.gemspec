$:.push File.expand_path("../lib", __FILE__)
require "twd97/version"

Gem::Specification.new do |s|
  s.name        = "twd97"
  s.version     = Twd97::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.licenses    = ["MIT"]
  s.summary     = "Convert TWD97 to WGS84"
  s.email       = "marsz@5fpro.com"
  s.homepage    = "https://github.com/marsz/twd97"
  s.description = "Convert TWD97 to WGS84"
  s.authors     = ['marsz']

  s.files         = `git ls-files`.split("\n")
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})

  s.require_paths = ["lib"]
  s.required_ruby_version = '>= 2.0.0'

  s.add_development_dependency "bundler", ">= 1.3"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec", ">= 3.0.0"
end
