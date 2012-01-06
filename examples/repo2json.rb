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
      pkgs = DebsFromRepos::Packages.new(repo.get_url)
      packages[server][suite][component] = pkgs.packages
    end
  end
end

puts JSON.pretty_generate(packages)
