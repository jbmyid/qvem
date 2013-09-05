# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qvem/version'

Gem::Specification.new do |gem|
  gem.name          = "qvem"
  gem.version       = Qvem::VERSION
  gem.authors       = ["Jalendra Bhanarkar"]
  gem.email         = ["jbmyid@gmail.com"]
  gem.description   = "Display error messages in qtips for all rails erros and jquery validation errors"
  gem.summary       = "Display error messages in qtips for all rails erros and jquery validation errors"
  gem.homepage      = ""
  gem.license       = "MIT"
  
  gem.files         = Dir["README.md", "LICENSE", "Rakefile", "vendor/**/*","config/**/*", "lib/**/*"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "bundler", "~> 1.3"
  gem.add_development_dependency "rake"
  gem.add_dependency "railties",  ">= 3.1.1"
end
