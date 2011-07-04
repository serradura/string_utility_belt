require File.join(File.dirname(__FILE__), '..', 'test_helper')

class RegexMeToSearchTest < Test::Unit::TestCase

  def test_should_return_a_regex_in_ruby
    assert_equal(/(foo|bar)/, "foo bar".regex_me_to_search_ruby)
  end

end
