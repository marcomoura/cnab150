# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cnab150/version'

Gem::Specification.new do |s|
  s.name          = 'cnab150'
  s.version       = Cnab150::VERSION
  s.authors       = ['Marco Moura']
  s.email         = ['marco.moura@gmail.com']

  s.summary       = 'Parser to Return File CNAB 150.'
  s.description   = 'Parser to Return File CNAB 150.'
  s.homepage      = 'https://github.com/marcomoura/cnab150'

  s.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  s.bindir        = 'exe'
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'bundler', '~> 1.10'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec'
end
