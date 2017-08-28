module Jekyll
  module URLJoinFilter
    def urljoin(*args)
      File.join(args)
    end
  end
end

Liquid::Template.register_filter(Jekyll::URLJoinFilter)
