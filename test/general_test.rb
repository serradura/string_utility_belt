require 'rubygems' if RUBY_VERSION < '1.9'
require 'test/unit'
require 'general'

class GeneralTest < Test::Unit::TestCase
  #describe #word
  def test_words_method
    assert_equal %w{Hello}, "Hello".words, "it should return a array with the Hello word"
    assert_equal ["Serradura's", "Labs"], "Serradura's Labs".words, "it should reurn a array with two words"
    assert_equal ["foo-foo", "bar's", "bar"], "foo-foo, bar's. bar!".words, "it should return 3 words"
  end

  #describe #simple_space
  def test_simple_space_method
    string = "    \n \r   \t\r\n foo \t bar    "

    assert_equal " foo bar ", string.simple_space, "it should replace any space by ' ' (the simple space)"

    assert_equal "    \n \r   \t\r\n foo \t bar    ", string,  "it should be the equal than before calling the method"

    assert_equal "Hello".simple_space, "Hello",  "it should return the same string if nothing change"
  end

  #describe #simple_space!
  def test_simple_space!
    string = "    \n \r   \t\r\n foo \t bar    "

    assert_equal " foo bar ", string.simple_space!, "it should replace any space by ' ' (the simple space)"

    assert_not_equal "    \n \r   \t\r\n foo \t bar    ", string,  "it should not be the equal than before calling the method"

    assert_nil "Hello".simple_space!,  "it should return nil if nothing change"
  end

end
