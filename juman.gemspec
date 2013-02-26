# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'juman/version'

Gem::Specification.new do |gem|
  gem.name          = "juman"
  gem.version       = Juman::VERSION
  gem.authors       = ["Hajime WAKAHARA"]
  gem.email         = ["hajime.wakahara@gmail.com"]
  gem.description   = %q{Use a sequence of morphemes as an Enumerable object.}
  gem.summary       = %q{A Wrapper for JUMAN: A Morphological Analyzer}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
end
