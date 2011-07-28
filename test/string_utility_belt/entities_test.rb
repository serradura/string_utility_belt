require File.join(File.dirname(__FILE__), '..', 'test_helper')
require File.join('string_utility_belt', 'entities')

class EntitiesTest < Test::Unit::TestCase

  def test_should_decode_entities
    assert_equal "<TAG>", "&lt;TAG&gt;".decode_entities
  end

  def test_should_decode_entities_and_clean_up_the_tags
    assert_equal "", "&lt;TAG&gt;".decode_entities_and_cleaner
  end

  def test_should_should_encode_anything_that_can_be_transformed_into_an_entity
    assert_equal "&lt;TAG&gt;", "<TAG>".generate_entities
  end

end
