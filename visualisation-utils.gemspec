Gem::Specification.new do |s|
  s.name         = 'visualisation-utils'
  s.summary      = 'utilities for quick visualisation'
  s.description  = 'visualisation-utils provides a number of utilities
                    for visualising data from the command line.'
  s.version      = '0.4'
  s.platform     = Gem::Platform::RUBY

  s.files        = ['bin/scatter-plot']

  s.bindir = 'bin'

  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  s.author      = 'Felix Leipold'
  s.email       = ''
  s.homepage    = 'https://github.com/programmiersportgruppe/visualisation-utils'
  s.license = 'MIT'

  s.add_dependency('trollop')
end

