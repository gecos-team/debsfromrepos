require 'open-uri'
require 'zlib'

module DebsFromRepos
  class Packages

    attr_reader :packages

    def initialize(packages_url, translations_url=nil)
      get_packages(packages_url)
      if translations_url
        lang_match = translations_url.match(/Translation-([a-z][a-z]).gz/)
        if lang_match
          lang = "-#{lang_match[1]}"
          get_packages(translations_url, lang)
        end
      end
    end

    private
    def get_packages(url, lang="")
      @packages ||= Hash.new
      begin
        zip_file = Zlib::GzipReader.new(open(url))
        packages_lines = zip_file.readlines("\n\n")
      rescue Exception => e
        packages_lines = []
      end
      packages_lines.each do |line|
        name_match = line.match(/Package:\s(.+)\n/)
        next unless name_match
        name = name_match[1]
        description = ''
        description_match = line.match(/Description#{lang}:\s(.+)\n/)
        description = description_match[1] if description_match
        @packages[name] = description
      end
    end

  end
end
