require 'test_helper'


class RailsMarkup::ConfigTest < ActiveSupport::TestCase
  class RailsMarkup::Language::CustomLang < RailsMarkup::Language

  end

  test 'config should return the available language object' do
    RailsMarkup::Config.languages = [:custom_lang]
    assert_nothing_raised do
      language = RailsMarkup::Config.custom_lang
      assert_not_nil language
      assert_equal RailsMarkup::Language::CustomLang, language.class
    end
  end

  test 'config language method should return a unique pointer' do
    RailsMarkup::Config.languages = [:custom_lang]
    language1 = RailsMarkup::Config.custom_lang
    language2 = RailsMarkup::Config.custom_lang
    assert language1.equal?(language2)
  end

  test 'method missing should still raise when the call is not the name of a language' do
    assert_raise NoMethodError do
      RailsMarkup::Config.send(:unknown_method)
    end
  end
end