require 'rails_markup/language'
require 'rails_markup/config'
require 'rails_markup/engine'

module RailsMarkup
  def self.config(&block)
    if block_given?
      block.call(RailsMarkup::Config)
    else
      RailsMarkup::Config
    end
  end
end
