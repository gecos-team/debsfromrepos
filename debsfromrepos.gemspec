# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','debsfromrepos_version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'debsfromrepos'
  s.version = DebsFromRepos::VERSION
  s.author = 'Juanje Ojeda'
  s.email = 'jojeda@emergya.com'
  s.homepage = 'https://github.com/gecos-team/debsfromrepos'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Lib to get the names and descriptions for the availables packages at specific (or group of them) Debian/Ubuntu repository.'
  s.description = '

== Description

This is a small lib to get the names and descriptions for the availables
packages at specific (or group of them) Debian/Ubuntu repository.

== Usage

You have a example of how the library works at the <tt>examples/</tt> directory:

  examples/repo2json.rb

Basicaly you require the lib

  require \'debsfromrepos\'

and ask for the right <tt>Packages.gz</tt> url for a specific Debian/Ubuntu server

  server = "http://us.archive.ubuntu.com/ubuntu"
  suite = "oneiric"
  component = "main"
  repository = DebsFromRepos::ListUrl.new(server, suite, component)
  repository.get_url
  # => "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/main/binary-i386/Packages.gz"

and then get all the packages\' names and descriptions on that component of
that suite of that repository:

  pkgs = DebsFromRepos::Packages.new(repositories)
  pkgs.packages[\'2ping\']
  # => "Ping utility to determine directional packet loss"
  '

# Add your other files here if you make them
  s.files = %w(
lib/debsfromrepos.rb
lib/debsfromrepos_version.rb
lib/debsfromrepos/list_url.rb
lib/debsfromrepos/packages.rb
examples/repo2json.rb
  )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','LICENSE']
  s.rdoc_options << '--title' << 'debsfromrepos' << '--main' << 'README.rdoc' << '--ri'
  #s.bindir = 'bin'
  #s.executables << 'debsfromrepo'
  s.add_development_dependency('rake')
  s.add_development_dependency('cucumber')
  s.add_development_dependency('json')
  s.add_development_dependency('rdoc')
  #s.add_development_dependency('aruba', '~> 0.4.6')
end
