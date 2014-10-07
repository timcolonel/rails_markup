module RailsMarkup
  class Language
    attr_accessor :extensions
    attr_accessor :engine
    attr_reader :renderer

    def initialize
      @extensions = []
      autodetect_engine
      render do |engine, text|
        engine.render(text)
      end
    end

    def extension(exts)
      @extensions += [*exts]
    end

    # Remove a mapped extension for this language
    # @param exts: Extension element/list to remove
    def remove_extension(exts)
      [*exts].each { |x| @extensions.delete(x) }
    end

    # Render block
    def render(&block)
      @renderer = block
    end

    protected

    # This is to be overwritten by specific language
    # This automatically detect and load the default markup language depending on what gem you have
    def autodetect_engine

    end
  end
end

require 'rails_markup/language/markdown'
require 'rails_markup/language/textile'