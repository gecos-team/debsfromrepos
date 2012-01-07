#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path('../../lib', __FILE__)
require 'debsfromrepos'
require 'json'

sources_lists = {
                  'http://us.archive.ubuntu.com/ubuntu' =>
                                      {
                                       "oneiric" => {
                                                     "main" => {}
                                                    },
                                        "oneiric-backports" => {
                                                                "main" => {},
                                                                "universe" => {}
                                                               },
                                      }
                }

packages = {}
sources_lists.each_pair do |server,suites|
  packages[server] = {}
  suites.each_pair do |suite,components|
    packages[server][suite] = {}
    components.each_pair do |component,pkgs|
      packages[server][suite][component] = {}
      repo = DebsFromRepos::ListUrl.new(server,suite,component)
      pkgs_url, translations_url = repo.get_packages_url, repo.get_translations_url('es')
      pkgs = DebsFromRepos::Packages.new(pkgs_url, translations_url)
      packages[server][suite][component] = pkgs.packages
    end
  end
end

puts JSON.pretty_generate(packages)
