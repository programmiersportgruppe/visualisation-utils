# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'visualisation-utils/version'

Gem::Specification.new do |gem|
  gem.name          = "visualisation-utils"
  gem.version       = Visualisation::Utils::VERSION
  gem.authors       = ["Felix Leipold"]
  gem.email         = [""]
  gem.description   = %q{visualisation-utils provides a number of utilities
                    for visualising data from the command line.}
  gem.summary       = %q{utilities for quick visualisation}
  gem.homepage      = "https://github.com/programmiersportgruppe/visualisation-utils"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('trollop')
end
