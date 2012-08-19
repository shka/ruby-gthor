# -*- encoding: utf-8 -*-
require File.expand_path('../lib/gthor/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Shintaro Katayama"]
  gem.email         = ["shintaro.katayama@gmail.com"]
  gem.description   = %q{Gthor - Thor with extension management on RubyGem framework}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/shka/ruby-gthor"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "gthor"
  gem.require_paths = ["lib"]
  gem.version       = Gthor::VERSION

  gem.add_dependency 'thor'
end
