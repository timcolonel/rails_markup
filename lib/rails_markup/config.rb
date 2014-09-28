module RailsMarkup
  module Config
    @languages = [:markdown, :textile]
    @languages_map = {}
    class << self
      attr_accessor :languages

      def method_missing(name, *args)
        if @languages.include?(name)
          @languages_map[name] ||= "RailsMarkup::Language::#{name.to_s.camelize}".constantize.new
        else
          super
        end
      end
    end
  end
end