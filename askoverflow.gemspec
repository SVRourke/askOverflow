
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "askoverflow/version"

Gem::Specification.new do |spec|
  spec.name          = "askoverflow"
  spec.version       = Askoverflow::VERSION
  spec.authors       = ["Sam Rourke"]
  spec.email         = ["samuel@rourke.tech"]

  spec.summary       = %q{commandline tool to search stackoverflow.}
  spec.description   = %q{commandline tool to search stackoverflow quickly and simply.}
  spec.homepage      = "https://github.com/SVRourke/askoverflow"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  
  spec.bindir        = "bin"
  spec.executables   = ["askoverflow"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.13"

  spec.add_runtime_dependency "nokogiri"
end
