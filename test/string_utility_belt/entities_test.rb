require File.join(File.dirname(__FILE__), '..', 'test_helper')

class EntitiesTest < Test::Unit::TestCase

  def test_should_decode_entities
    assert_equal "<TAG>", "&lt;TAG&gt;".decode_entities
  end

  def test_should_decode_entities_and_clean_up_the_tags
    assert_equal "", "&lt;TAG&gt;".decode_entities_and_cleaner
  end

end
