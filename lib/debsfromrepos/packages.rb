require 'open-uri'
require 'zlib'

module DebsFromRepos
  class Packages

    attr_reader :names

    def initialize(url)
      @url = url
      get_names
    end

    private
    def get_names
      @names = []
      begin
        zip_file = Zlib::GzipReader.new(open(@url))
        packages_lines = zip_file.readlines("\n\n")
      rescue Exception => e
        packages_lines = []
      end
      packages_lines.each do |line|
        name_match = line.match(/Package:\s(.+)\n/)
        next unless name_match
        @names << name_match[1]
      end
    end

  end
end
