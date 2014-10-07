module RailsMarkup
  class Language
    class Markdown < RailsMarkup::Language
      def initialize
        super
        extension [:md, :markdown]
      end

      # Autodetect markdown language
      # Will load the default engine.
      # Searching for Redcarpet, Github::Markdown
      def autodetect_engine
        @engine = if defined? Redcarpet
                    Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                            autolink: true,
                                            space_after_headers: true,
                                            fenced_code_blocks: true)
                  elsif defined? GitHub::Markdown
                    GitHub::Markdown
                  end
      end

    end
  end
end