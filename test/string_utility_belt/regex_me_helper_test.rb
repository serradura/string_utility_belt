# coding: utf-8

require File.join(File.dirname(__FILE__), '..', 'test_helper')

class RegexMeHelperTest < Test::Unit::TestCase

  def test_should_create_a_string_with_the_latin_char_variations_for_the_letter_A
    assert_equal("[aàáâãä]", "a".regex_latin_ci_list)
  end

  def test_should_create_a_string_with_the_latin_char_variations_for_the_letter_E
    assert_equal("[eèéêë]", "e".regex_latin_ci_list)
  end

  def test_should_create_a_string_with_the_latin_char_variations_for_the_letter_I
    assert_equal("[iìíîï]", "i".regex_latin_ci_list)
  end

  def test_should_create_a_string_with_the_latin_char_variations_for_the_letter_O
    assert_equal("[oòóôõö]", "o".regex_latin_ci_list)
  end

  def test_should_create_a_string_with_the_latin_char_variations_for_the_letter_U
    assert_equal("[uùúûü]", "u".regex_latin_ci_list)
  end

  def test_should_create_a_string_with_the_latin_char_variations_for_the_letter_C
    assert_equal("[cç]", "c".regex_latin_ci_list)
  end

  def test_should_create_a_string_with_the_latin_char_variations_for_the_letter_N
    assert_equal("[nñ]", "n".regex_latin_ci_list)
  end

  def test_should_replace_all_chars_that_match_with_latin_chars_list
    # expected = "r[eèéêë]g[eèéêë]x [iìíî]s [nñ][oòóôõö]t f[oòóôõö]r w[eèéêë][aàáâãä]ks"

    expected ="r[e\303\250\303\251\303\252\303\253]g[e\303\250\303\251\303\252\303\253]x [i\303\254\303\255\303\256\303\257]s [n\303\261][o\303\262\303\263\303\264\303\265\303\266]t f[o\303\262\303\263\303\264\303\265\303\266]r w[e\303\250\303\251\303\252\303\253][a\303\240\303\241\303\242\303\243\303\244]ks"

    assert expected.include?("regex is not for weaks".regex_latin_ci_list)
  end
end
