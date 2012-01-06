# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','debsfromrepos_version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'debsfromrepos'
  s.version = DebsFromRepos::VERSION
  s.author = 'Juanje Ojeda'
  s.email = 'jojeda@emergya.com'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Lib to get the names and descriptions for the availables packages at specific (or group of them) Debian/Ubuntu repository.'
# Add your other files here if you make them
  s.files = %w(
lib/debsfromrepos.rb
lib/debsfromrepos_version.rb
lib/debsfromrepos/list_url.rb
lib/debsfromrepos/packages.rb
examples/repo2json.rb
  )
  s.require_paths << 'lib'
  #s.has_rdoc = true
  #s.extra_rdoc_files = ['README.rdoc','debsfromrepos.rdoc']
  #s.rdoc_options << '--title' << 'debsfromrepos' << '--main' << 'README.rdoc' << '-ri'
  #s.bindir = 'bin'
  #s.executables << 'debsfromrepo'
  s.add_development_dependency('rake')
  s.add_development_dependency('cucumber')
  s.add_development_dependency('open-uri')
  s.add_development_dependency('zlib')
  s.add_development_dependency('json')
  #s.add_development_dependency('rdoc')
  #s.add_development_dependency('aruba', '~> 0.4.6')
end
