require 'rake/clean'
require 'rubygems'
require 'rake/gempackagetask'
require 'rdoc/task'

Rake::RDocTask.new do |rd|
  rd.main = "README.rdoc"
  rd.rdoc_files.include(
                        "README.rdoc",
                        "lib/**/*.rb",
                        "bin/**/*",
                        "features/**/*"
                       )
  rd.title = "DebsFromRepos: A simple libary to get the packages' names and descriptions from a repository"
end

spec = eval(File.read('debsfromrepos.gemspec'))

Rake::GemPackageTask.new(spec) do |pkg|
end

require 'cucumber'
require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty -x"
  t.fork = false
end

task :default => :gem
