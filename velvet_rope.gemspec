# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "velvet_rope"
  gem.version       = "0.0.3"
  gem.authors       = ["Sean Gaffney"]
  gem.email         = ["sean@seangaffney.cc"]
  gem.description   = %q{VelvetRope is a renderer to complement and enhance Redcarpet's default HTML renderer. It adds support for emoji and syntax-highlighting.}
  gem.summary       = %q{Provides out-of-the-box syntax-highlighting and emoji support for the Redcarpet markdown library.}
  gem.homepage      = "http://github.com/seangaffney/velvet_rope"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec"

  gem.add_runtime_dependency "redcarpet"
  gem.add_runtime_dependency "pygments.rb"
  gem.add_runtime_dependency "gemoji"
end
