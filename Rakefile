require 'rspec/core/rake_task'
require 'rake/clean'
RSpec::Core::RakeTask.new('spec')

PROG = 'title_case'
NAME = 'titlecase'
LIB  = FileList['lib/*.rb']
BIN  = FileList['bin/*.rb']
TEST = FileList['spec/*.rb']
MAN  = FileList['man/man*/*.?']
SPEC = "#{PROG}.gemspec"
CLEAN.include('doc', '*.gem')
MANDIR = '/usr/local/man/man1/'

task :all => [:spec, :install]

task :default => :spec

task :test => :spec

task :spec 

file 'doc' => LIB  do
  `rdoc lib/title_case.rb`        #FIXME this is not the canonical way to do it
end

task :install => [:install_bins, :install_man]

task :install_bins do
end

task :install_man do
  mkdir_p MANDIR
  cp MAN, MANDIR
end

task :push do
end

