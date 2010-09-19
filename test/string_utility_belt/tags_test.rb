require 'test_helper'

class TagsTest < Test::Unit::TestCase
  
  def test_should_cleaner_tag
    assert_equal "<html>".html_tag_cleaner, ''
  end
  
end