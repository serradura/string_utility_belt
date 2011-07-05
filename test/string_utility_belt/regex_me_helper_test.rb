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
    expected = "r[eèéêë]g[eèéêë]xp [iìíîï]s p[oòóôõö]w[eèéêë]rf[uùúûü]ll"

    assert_equal expected, "regexp is powerfull".regex_latin_ci_list
  end

  def test_should_returns_the_OR_metachar_if_or_options_was_passed
    assert_equal "OR == |", "OR == ".regex_builder(:or => true)
  end

  def test_should_not_return_OR_when_passed_OR_options_is_false
    assert_equal "without OR", "without OR".regex_builder(:or => false)
  end

  def test_should_return_the_border_metachar_in_left_when_its_required_for_ruby
    left = '\b'
    expected = left + "string"
    border = {:to => :ruby, :direction => :left}

    assert_equal expected, "string".regex_builder(:border => border)
  end

  def test_should_return_the_border_metachar_right_when_its_required_for_ruby
    right = '\b'
    expected = "string" + right
    border = {:to => :ruby, :direction => :right}

    assert_equal expected, "string".regex_builder(:border => border)
  end

  def test_should_return_the_border_metachar_in_left_and_right_when_its_required_for_ruby
    left = '\b'
    right = '\b'
    expected = left + "string" + right
    border = {:to => :ruby, :direction => :both}

    assert_equal expected, "string".regex_builder(:border => border)
  end

  def test_when_ruby_should_return_same_text_if_the_border_to_direction_is_invalid
    text = "string"
    border = {:to => :ruby}

    assert_same text, text.regex_builder(:border => border)
  end

  def test_should_return_the_border_metachar_in_left_when_its_required_for_mysql
    left = '[[:<:]]'
    expected = left + "string"
    border = {:to => :mysql, :direction => :left}

    assert_equal expected, "string".regex_builder(:border => border)
  end

  def test_should_return_the_border_metachar_right_when_its_required_for_mysql
    right = '[[:>:]]'
    expected = "string" + right
    border = {:to => :mysql, :direction => :right}

    assert_equal expected, "string".regex_builder(:border => border)
  end

  def test_should_return_the_border_metachar_in_left_and_right_when_its_required_for_mysql
    left = '[[:<:]]'
    right = '[[:>:]]'
    expected = left + "string" + right
    border = {:to => :mysql, :direction => :both}

    assert_equal expected, "string".regex_builder(:border => border)
  end

  def test_when_mysql_should_return_same_text_if_the_border_to_direction_is_invalid
    text = "string"
    border = {:to => :mysql, :direction => nil}

    assert_same text, text.regex_builder(:border => border)
  end

  def test_should_return_an_mix_of_buildered_pattern_options
    expected = "f.*[oòóôõö]"
    assert_equal expected, "f*o".regex_builder(:any => true, :latin_chars_variations => true)
  end
end
