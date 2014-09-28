module RailsMarkup
  class Language
    attr_accessor :extensions
    attr_accessor :engine
    attr_reader :renderer

    def initialize
      @extensions = []
      autodetect_engine
      render do |text|
        engine.render(text)
      end
    end

    def extension(exts)
      @extensions += [*exts]
    end

    def remove_extension(exts)
      [*exts].each { |x| @extensions.delete(x) }
    end

    def render(&block)
      @renderer = block
    end

    protected

    def autodetect_engine

    end
  end
end

require 'rails_markup/language/markdown'
require 'rails_markup/language/textile'