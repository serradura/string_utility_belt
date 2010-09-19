require 'test_helper'

class GeneralTest < Test::Unit::TestCase
  
  def test_should_return_words_in_array
    assert_equal "abc".words, ['abc']
  end
  
  def test_should_return_all_words_as_element_in_array
    assert_equal "abc def ghi".words, ['abc', 'def', 'ghi']
  end
  
  def test_should_ignore_simple_spaces
    assert_equal 'abc def'.simple_space, 'abc def'
  end
  
end