# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'irbthbound/version'

Gem::Specification.new do |spec|
  spec.name          = "irbthbound"
  spec.version       = Irbthbound::VERSION
  spec.authors       = ["Dave Yarwood"]
  spec.email         = ["dave.yarwood@gmail.com"]

  spec.summary       = %q{An esoteric port of Earthbound/Mother 2 to IRB}
  spec.homepage      = "https://github.com/daveyarwood/irbthbound"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end

