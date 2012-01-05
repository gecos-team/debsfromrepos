module DebsFromRepos
  class ListUrl

    attr_accessor :suite, :component

    def initialize(url, suite='', component='')
      @url = url
      @suite = suite
      @component = component
    end

    def get_url
      if @suite.empty?
        $stderr.puts "ERROR: the suite was missing"
        return nil
      elsif @component.empty?
        $stderr.puts "ERROR: the component was missing"
        return nil
      end
      unless @url.match(/(http|ftp)s*:\/\/([\S]*)\/.*/)
        $stderr.puts "ERROR: the url format is wrong"
        return nil
      end
      "#{@url}/dists/#{@suite}/#{@component}/binary-i386/Packages.gz"
    end
  end
end
