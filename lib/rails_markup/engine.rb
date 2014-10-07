module RailsMarkup
  class Handler
    include ActionView::Helpers::TagHelper

    class_attribute :default_format
    self.default_format = Mime::HTML

    def initialize(language)
      @language = language
    end

    # @param template [ActionView::Template]
    # @return [String] Ruby code that when evaluated will return the rendered
    #   content
    def call(template)
      rendered = @language.renderer.yield(@language.engine, template.source)
      content = content_tag_string :div, rendered.html_safe, class: "markup-content #{@language.class.name.demodulize.underscore}"
      output = content_tag_string :div, content, class: 'markup-wrapper'
      "#{output.inspect}.html_safe"
    end
  end
end

RailsMarkup::Config.languages.each do |name|
  language = RailsMarkup::Config.send(name)
  language.extensions.each do |extension|
    ActionView::Template.register_template_handler(extension, RailsMarkup::Handler.new(language))
  end
end