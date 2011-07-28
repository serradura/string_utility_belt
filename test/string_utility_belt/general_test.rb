require File.join(File.dirname(__FILE__), '..', 'test_helper')
require File.join('string_utility_belt', 'commons')
require File.join('string_utility_belt', 'regex_me')
require File.join('string_utility_belt', 'general')

class GeneralTest < Test::Unit::TestCase

  def setup
    @text = %q{Texto de teste!
               Esta classe deverá fazer a busca por uma ou um grupo de palavras
               em um texto e retornar um rank com a quantidade identificada.}
  end

  # describe #have_this_words?
  def test_should_be_true_if_find_all_of_the_text_fragments
    assert @text.have_this_words?("busca ran".words)
  end

  def test_should_be_false_because_not_exists_the_ran_word
    assert_not_equal true, @text.have_this_words?("ran busca".words, true)
  end

  # describe #not_have_this_words?
  def test_should_be_true_if_not_find_all_of_the_searched_words
    assert_equal true, @text.not_have_this_words?("ran busc".words, true)
  end

  def test_should_match_even_if_there_are_characters_variations
    text = "São páúlõ is a very nice city!"
    assert text.have_this_words?("sao paulo".words, :latin_chars_variations => true)
  end
end
