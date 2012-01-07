module DebsFromRepos
  class ListUrl

    attr_accessor :suite, :component, :lang

    def initialize(url, suite='', component='', lang=nil)
      @url = url
      @suite = suite
      @component = component
      @lang = lang
    end

    def get_packages_url
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

    def get_translations_url(lang=nil)
      @lang = lang ? lang : @lang
      unless @lang
        $stderr.puts "ERROR: no language has been selected"
        return nil
      end
      unless @lang.match(/^[a-z][a-z]$/)
        $stderr.puts "ERROR: the language is wrong"
        return nil
      end
      "#{@url}/dists/#{@suite}/#{@component}/i18n/Translation-#{@lang}.gz"
    end
  end
end
