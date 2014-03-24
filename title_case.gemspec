require './lib/title_case'

Gem::Specification.new do |s|
  s.name        = 'title_case'
  s.version     = TitleCase::VERSION
  s.date        = '2014-03-14'
  s.required_ruby_version = '>=1.9.2'
  s.summary     = 'String Methods and CLI to Properly Title Case a Headline.'
  s.description = "title_case is a set of Ruby String methods for title casing,
                    and a command-line utility using those methods. Not to be 
                    confused with Sam Souder's titlecase."
  s.authors     = ['Noah Birnel']
  s.email       = 'nbirnel@gmail.com'
  s.homepage    = 'http://github.com/nbirnel/titlecase'
  s.files       = ['README.md', 'title_case.gemspec', 'lib/title_case.rb', 'spec/title_case_spec.rb', 'bin/titlecase']
  s.has_rdoc    = true
  s.executables = ['titlecase']
  s.license     = 'MIT'
end
