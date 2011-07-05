require File.join(File.dirname(__FILE__), '..', 'test_helper')

class RegexMeToSearchTest < Test::Unit::TestCase

  def test_should_return_a_regex_for_ruby
    assert_equal(/(foo|bar)/, "foo bar".regex_me_to_search_ruby)
  end

  def test_should_return_a_regex_for_mysql
    assert_equal("(foo|bar)", "foo bar".regex_me_to_search_mysql)
  end

  def test_should_match_the_phrase_for_ruby
    text  = "ruby frameworks is so cool"
    regexp = "ruby frameworks".regex_me_to_search_ruby(:exact_phrase => true)
    assert_match(regexp, text)
  end

  def test_should_match_independent_of_the_non_word_chars_between_the_words_phrase_for_ruby
    text  = "ruby - on - rails"
    regexp = "ruby on rails".regex_me_to_search_ruby(:exact_phrase => true)
    assert_match(regexp, text)
  end

end
