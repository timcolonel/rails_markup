require 'test_helper'

class RailsMarkup::LanguageTest < ActiveSupport::TestCase

  test 'language extensions should be empty' do
    language = RailsMarkup::Language.new
    assert_empty language.extensions
  end

  test '#extension should add 1 extension' do
    language = RailsMarkup::Language.new
    language.extension :custom
    assert language.extensions.include?(:custom)
  end

  test '#extension should add multiple extension' do
    language = RailsMarkup::Language.new
    exts = [:custom, :custom2]
    language.extension exts
    assert_equal exts.size, language.extensions.size
    exts.each do |ext|
      assert language.extensions.include?(ext)
    end
  end

  test '#remove_extension should remove 1 extension' do
    language = RailsMarkup::Language.new
    exts = [:extension1, :extension2]
    language.extensions = exts.clone
    language.remove_extension exts.first
    assert_equal exts.size - 1, language.extensions.size
    assert_not language.extensions.include?(exts.first)
  end

  test '#remove_extension should remove multiple extension' do
    language = RailsMarkup::Language.new
    exts = [:extension1, :extension2]
    language.extensions = exts.clone
    language.remove_extension exts
    assert_empty language.extensions
    exts.each do |ext|
      assert_not language.extensions.include?(ext)
    end
  end


end