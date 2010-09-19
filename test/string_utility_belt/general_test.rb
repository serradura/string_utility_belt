require 'test_helper'

class GeneralTest < Test::Unit::TestCase
  
  def test_should_return_words_in_array
    assert_equal "abc".words, ['abc']
  end
  
  def test_should_return_all_words_as_element_in_array
    assert_equal "abc def ghi".words, ['abc', 'def', 'ghi']
  end
  
  def test_should_ignore_spaces_in_the_middle
    assert_equal 'abc def'.simple_space, 'abc def'
  end
  
  def test_should_exclude_spaces_on_the_left
    assert_equal '   \o/!'.simple_space, '\o/!'
  end
  
  def test_should_exclude_spaces_on_the_right
    assert_equal '\o/!     '.simple_space, '\o/!'
  end
  
  def test_should_generate_a_new_object
    assert_not_same '\o/  '.simple_space, '\o/'
  end
  
  def test_should_not_generate_a_new_object
    assert_not_same '\o/  '.simple_space!, '\o/'    
  end
  
end