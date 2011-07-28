require File.join(File.dirname(__FILE__), '..', 'test_helper')

class CommonsTest < Test::Unit::TestCase

  def test_should_contains_commons_module
    require File.join('string_utility_belt', 'commons')
    assert Stringub.constants.include?("Commons")
  end

end
