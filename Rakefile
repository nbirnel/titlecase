require 'rspec/core/rake_task'
require 'rake/clean'
RSpec::Core::RakeTask.new('spec')

VER  = '0.2.1'
PROG = 'title_case'
NAME = 'titlecase'
LIB  = FileList['lib/*.rb']
BIN  = FileList['bin/*.rb']
TEST = FileList['spec/*.rb']
MAN  = FileList['man/man*/*.?']
MANFILE = "#{NAME}.1"
SPEC = "#{PROG}.gemspec"
GEM  = "#{PROG}-#{VER}.gem"
CLEAN.include('doc', '*.gem')
MANDIR = '/usr/local/man/man1/'
MANDEST = [MANDIR, MANFILE].join '/'

task :all => [:spec, :install]

task :default => :spec

task :test => :spec

task :spec 

file 'doc' => LIB  do
  `rdoc lib/title_case.rb`        #FIXME shell out not cool
end

task :gem => GEM

file GEM => [LIB, BIN, TEST, MAN, SPEC].flatten do
  `gem build #{SPEC}`            #FIXME shell out not cool
end

task :install => [:install_gem, :install_man]

task :install_gem => GEM do
  `gem install #{GEM}`            #FIXME shell out not cool
end

task :install_man => MAN do
  mkdir_p MANDIR
  cp MAN, MANDIR
end

task :push => :gem do
  `gem push #{GEM}`            #FIXME shell out not cool
end

task :uninstall do
  `gem uninstall #{PROG}`     #FIXME shell out not cool
  File.delete MANDEST
end
