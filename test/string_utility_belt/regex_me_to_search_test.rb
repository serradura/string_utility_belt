require File.join(File.dirname(__FILE__), '..', 'test_helper')

class RegexMeToSearchTest < Test::Unit::TestCase

  def test_should_return_a_regex_in_ruby
    assert_equal(/(foo|bar)/, "foo bar".regex_me_to_search_ruby)
  end

  def test_should_return_a_regex_in_mysql
    assert_equal("(foo|bar)", "foo bar".regex_me_to_search_mysql)
  end

  def test_describe_exact_phrases_when_want_match_two_terms_in_ruby
    text  = "ruby frameworks is so cool"
    regexp = "ruby frameworks".regex_me_to_search_ruby(:exact_phrase => true)
    assert_match(regexp, text)
  end

end
