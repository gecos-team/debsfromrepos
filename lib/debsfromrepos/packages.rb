require 'open-uri'
require 'zlib'

module DebsFromRepos
  class Packages

    attr_reader :packages

    def initialize(url)
      @url = url
      get_packages
    end

    private
    def get_packages
      @packages = Hash.new
      begin
        zip_file = Zlib::GzipReader.new(open(@url))
        packages_lines = zip_file.readlines("\n\n")
      rescue Exception => e
        packages_lines = []
      end
      packages_lines.each do |line|
        name_match = line.match(/Package:\s(.+)\n/)
        next unless name_match
        name = name_match[1]
        description = ''
        description_match = line.match(/Description:\s(.+)\n/)
        description = description_match[1] if description_match
        @packages[name] = description
      end
    end

  end
end
