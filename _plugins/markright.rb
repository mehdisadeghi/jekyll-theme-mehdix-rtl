require 'kramdown'

class Jekyll::Converters::Markdown::Markright
  def initialize(config)
    require 'kramdown'
    @config = config
  rescue LoadError
    STDERR.puts 'You are missing a library required for Markdown. Please run:'
    STDERR.puts '  $ [sudo] gem install kramdown'
    raise FatalException.new("Missing dependency: kramdown")
  end

  def convert(content)
    ::Kramdown::Document.new(content, @config['kramdown']).to_RTL
  end
end


module Kramdown
  module Converter
    class RTL < Html
      def convert_codeblock(el, indent)
        if not el.attr['dir']
          el.attr['dir'] = 'ltr'
        end
        return super(el, indent)
      end

      def convert_codespan(el, indent)
        if not el.attr['dir']
          el.attr['dir'] = 'ltr'
        end
        return super(el, indent)
      end

      def add_code_tags(code)
        code = code.sub(/<pre>/,'<pre><code dir="ltr">')
        code = code.sub(/<\/pre>/,"</code></pre>")
      end
    end
  end
end