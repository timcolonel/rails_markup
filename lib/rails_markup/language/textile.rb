module RailsMarkup
  class Language
    class Textile < RailsMarkup::Language
      def initialize
        super
        extension :textile
      end
    end
  end
end