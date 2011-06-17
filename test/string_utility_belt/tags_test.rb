require File.join(File.dirname(__FILE__), '..', 'test_helper')

class TagsTest < Test::Unit::TestCase

  def test_should_cleaner_a_html_tag
    assert_equal "", "<html>".html_tag_cleaner
  end

  def test_should_not_cleaner_if_is_not_a_html_tag
    assert_equal "<serradura>", "<serradura>".html_tag_cleaner
  end

  def test_should_cleaner_all_tags_and_just_keep_the_text
    assert_equal "Serradura Labs", "<a href='http://blog.serraduralabs.com'>Serradura Labs</a>".html_tag_cleaner
  end

  def test_should_cleaner_anything_like_an_tag
    assert_equal "", "<a></b></serradura><></>".tag_cleaner
  end

end
