require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new('spec')

task :default => :spec

task :test => :spec

task :spec 

task :make_doc  do
  `rdoc lib/title_case.rb`        #FIXME this is not the canonical way to do it
end
