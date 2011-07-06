require File.join(File.dirname(__FILE__), '..', 'test_helper')

class RegexMeToSearchTest < Test::Unit::TestCase

  def setup
    @text = "ruby frameworks is so cool"
  end

  def test_should_return_a_regex_for_ruby
    assert_equal(/(foo|bar)/, "foo bar".regex_me_to_search_ruby)
  end

  def test_should_return_a_regex_for_mysql
    assert_equal("(foo|bar)", "foo bar".regex_me_to_search_mysql)
  end

  def test_should_match_the_phrase_for_ruby
    regexp = "ruby frameworks".regex_me_to_search_ruby(:exact_phrase => true)
    assert_match(regexp, @text)
  end

  def test_should_match_independent_of_the_non_word_chars_between_the_words_phrase_for_ruby
    text  = "ruby - on - rails"
    regexp = "ruby on rails".regex_me_to_search_ruby(:exact_phrase => true)
    assert_match(regexp, text)
  end

  def test_should_match_the_text_fragments
    regexp = "rub ool".regex_me_to_search_ruby(:exact_word => false)
    assert_match(regexp, @text)
  end

  def test_should_not_match_the_text_fragments
    regexp = "rub ool".regex_me_to_search_ruby(:exact_word => true)
    assert_no_match(regexp, @text)
  end

  def test_should_just_match_exact_word
    regexp = "ruby cool".regex_me_to_search_ruby(:exact_word => true)
    assert_match(regexp, @text)
  end

  def test_should_match_because_the_word_finish_with_the_letter_A
    text  = "sinatra"
    regexp = "*a".regex_me_to_search_ruby
    assert_match(regexp, text)
  end

  def test_should_match_because_the_word_begin_with_the_letter_A
    text  = "assertions"
    regexp = "a*".regex_me_to_search_ruby
    assert_match(regexp, text)
  end

  def test_should_match_because_the_word_contain_all_required_letters
    text  = "sinatraaa"
    regexp = "s*n*t*a".regex_me_to_search_ruby
    assert_match(regexp, text)
  end

  def test_should_return_the_matched_sentencest
    text  = "sinatra"
    regexp = "*a".regex_me_to_search_ruby
    assert_match(regexp, text)
  end

end
