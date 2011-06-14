require 'rubygems' if RUBY_VERSION < '1.9'
require 'test/unit'
require 'general'

#before all
class String
  include General
end

class GeneralTest < Test::Unit::TestCase
  #describe #word
  def test_words_method
    assert_equal %w{Hello}, "Hello".words, "it should return a array with the Hello word"
    assert_equal ["Serradura's", "Labs"], "Serradura's Labs".words, "it should reurn a array with two words"
    assert_equal ["foo-foo", "bar's", "bar"], "foo-foo, bar's. bar!".words, "it should return 3 words"
  end
end
