# coding: utf-8

require File.join(File.dirname(__FILE__), '..', '..', 'test_helper')
require File.join('string_utility_belt', 'commons')
require File.join('string_utility_belt', 'regex_me')

class RegexMeHelperTest < Test::Unit::TestCase

  def setup
    @rmh = RegexMe::Helper.new
  end

  def test_should_create_a_string_with_the_latin_char_variations_for_the_letter_A
    @rmh.string = "a"
    assert_equal("(a|à|á|â|ã|ä)", @rmh.set_latin_variations)
  end

  def test_should_create_a_string_with_the_latin_char_variations_for_the_letter_E
    @rmh.string = "e"
    assert_equal("(e|è|é|ê|ë)", @rmh.set_latin_variations)
  end

  def test_should_create_a_string_with_the_latin_char_variations_for_the_letter_I
    @rmh.string = "i"
    assert_equal("(i|ì|í|î|ï)", @rmh.set_latin_variations)
  end

  def test_should_create_a_string_with_the_latin_char_variations_for_the_letter_O
    @rmh.string = "o"
    assert_equal("(o|ò|ó|ô|õ|ö)", @rmh.set_latin_variations)
  end

  def test_should_create_a_string_with_the_latin_char_variations_for_the_letter_U
    @rmh.string = "u"
    assert_equal("(u|ù|ú|û|ü)", @rmh.set_latin_variations)
  end

  def test_should_create_a_string_with_the_latin_char_variations_for_the_letter_C
    @rmh.string = "c"
    assert_equal("(c|ç)", @rmh.set_latin_variations)
  end

  def test_should_create_a_string_with_the_latin_char_variations_for_the_letter_N
    @rmh.string = "n"
    assert_equal("(n|ñ)", @rmh.set_latin_variations)
  end

  def test_should_replace_all_chars_that_found_in_latin_variantion_list
    expected = "r(e|è|é|ê|ë)g(e|è|é|ê|ë)xp (i|ì|í|î|ï)s p(o|ò|ó|ô|õ|ö)w(e|è|é|ê|ë)rf(u|ù|ú|û|ü)ll"

    @rmh.string = "regexp is powerfull"

    assert_equal expected, @rmh.set_latin_variations
  end

  def test_should_returns_the_OR_metachar_if_or_options_was_passed
    assert_equal "OR == |", @rmh.builder("OR == ", :or => true)
  end

  def test_should_not_return_OR_when_the_OR_options_is_false
    assert_equal "without OR", @rmh.builder("without OR", :or => false)
  end

  def test_should_return_the_border_metachar_in_left_when_its_required_for_ruby
    left = '\b'
    expected = left + "string"
    border = {:to => :ruby, :direction => :left}

    assert_equal expected, @rmh.builder("string", :border => border)
  end

  def test_should_return_the_border_metachar_in_right_when_its_required_for_ruby
    right = '\b'
    expected = "string" + right
    border = {:to => :ruby, :direction => :right}

    assert_equal expected, @rmh.builder("string", :border => border)
  end

  def test_should_return_the_border_metachar_in_left_and_right_when_its_required_for_ruby
    left = '\b'
    right = '\b'
    expected = left + "string" + right
    border = {:to => :ruby, :direction => :both}

    assert_equal expected, @rmh.builder("string", :border => border)
  end

  def test_for_ruby_should_return_the_same_text_if_the_border_to_direction_is_invalid
    text = "string"
    border = {:to => :ruby}

    assert_same text, @rmh.builder(text, :border => border)
  end

  def test_should_return_the_border_metachar_in_left_when_its_required_for_mysql
    left = '[[:<:]]'
    expected = left + "string"
    border = {:to => :mysql, :direction => :left}

    assert_equal expected, @rmh.builder("string", :border => border)
  end

  def test_should_return_the_border_metachar_in_right_when_its_required_for_mysql
    right = '[[:>:]]'
    expected = "string" + right
    border = {:to => :mysql, :direction => :right}

    assert_equal expected, @rmh.builder("string", :border => border)
  end

  def test_should_return_the_border_metachar_in_left_and_right_when_its_required_for_mysql
    left = '[[:<:]]'
    right = '[[:>:]]'
    expected = left + "string" + right
    border = {:to => :mysql, :direction => :both}

    assert_equal expected, @rmh.builder("string", :border => border)
  end

  def test_for_mysql_should_return_the_same_text_if_the_border_to_direction_is_invalid
    text = "string"
    border = {:to => :mysql, :direction => nil}

    assert_same text, @rmh.builder(text, :border => border)
  end

  def test_should_return_a_mix_of_regexp_options
    expected = "f.*(o|ò|ó|ô|õ|ö)"
    assert_equal expected, @rmh.builder("f*o", :any => true, :latin_chars_variations => true)
  end
end
