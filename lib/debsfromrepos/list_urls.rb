module DebsFromRepos
  class ListUrls

    attr_accessor :suites, :components

    def initialize(url, suites=[], components=[])
      @url = url
      @suites = suites
      @components = components
    end

    def get_urls
      urls = []
      @suites.each do |suite|
        @components.each do |component|
          urls << "#{@url}/dists/#{suite}/#{component}/binary-i386/Packages.gz"
        end
      end
      urls
    end
  end
end
