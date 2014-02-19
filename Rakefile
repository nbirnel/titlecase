require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new('spec')

task :all => [:spec, :install]

task :default => :spec

task :test => :spec

task :spec 

task :doc  do
  `rdoc lib/title_case.rb`        #FIXME this is not the canonical way to do it
end

task :install => [:install_bins, :install_man]

task :install_bins do
end

task :install_man do
end

task :push do
end

task :clean do
end

task :clean do
  file_helper('doc') { rmdir_recurse('doc') }
end

def file_helper file 
  { yield } if File.exists? file 
end

def rm_recurse file
  File.file? file ? File.delete(file) : rmdir_recurse file
end

def rmdir_recurse dir
  Dir[dir + '/*'].each {|f| rm_recurse f} 
  Dir.rmdir dir
end
