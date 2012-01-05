module DebsFromRepos
  class ListUrls

    attr_accessor :suite, :component

    def initialize(url, suite='', component='')
      @url = url
      @suite = suite
      @component = component
    end

    def get_url
      return nil if @suite.empty? || @component.empty?
      return nil unless @url.match(/(http|ftp)s*:\/\/([\S]*)\/.*/)
      "#{@url}/dists/#{@suite}/#{@component}/binary-i386/Packages.gz"
    end
  end
end
