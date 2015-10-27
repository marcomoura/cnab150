# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cnab150/version'

Gem::Specification.new do |spec|
  spec.name          = "cnab150"
  spec.version       = Cnab150::VERSION
  spec.authors       = ["Marco Moura"]
  spec.email         = ["marco.moura@gmail.com"]

  spec.summary       = %q{Return File CNAB 150.}
  spec.description   = %q{Return File CNAB 150.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
