require 'test_helper'

class MatchRankTest < Test::Unit::TestCase
  
  def test_should_return_the_precision_of_a_word
    assert_equal "foo bar".words_frequency_by(['f'])[:matched], {'f' => 1} # ugly code
  end
  
end