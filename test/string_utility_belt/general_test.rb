require File.join(File.dirname(__FILE__), '..', 'test_helper')

class GeneralTest < Test::Unit::TestCase

  def setup
    @spaces_and_some_text = "    \n \r   \t\r\n foo \t bar    "

    @text = %q{Texto de teste!
               Esta classe deverá fazer a busca por uma ou um grupo de palavras
               em um texto e retornar um rank com a quantidade identificada.}
  end

  def test_should_return_a_single_word_in_array
    assert_equal %w{Hello}, "Hello".words
  end

  def test_should_return_all_words_as_element_in_array
    assert_equal ["foo-foo", "bar's", "bar"], "foo-foo, bar's. bar!".words
  end

  def test_should_replace_an_sequence_of_space_per_a_unique_space
    assert_equal " foo bar ", @spaces_and_some_text.simple_space
  end

  def test_should_replace_the_left_spaces_by_only_one
    assert_equal '   \o/!'.simple_space, ' \o/!'
  end

  def test_should_replace_the_right_spaces_by_only_one
    assert_equal '\o/!     '.simple_space, '\o/! '
  end

  def test_should_be_the_same_result_after_calling_the_method
    string = @spaces_and_some_text.dup
    assert_equal string, "    \n \r   \t\r\n foo \t bar    "
  end

  def test_should_return_the_same_text_if_nothing_changed
    assert_equal "Hello", "Hello".simple_space
  end


  #describe #simple_space!
  def test_should_not_generate_a_new_object
    @spaces_and_some_text.simple_space!

    assert_not_same ' foo bar ', @spaces_and_some_text
  end

  def test_should_return_nil_if_nothing_changed
    assert_nil "Hello".simple_space!
  end


  # describe #have_this_words?
  def test_should_be_true_if_find_all_of_the_text_fragments
    assert @text.have_this_words?("busca ran".words)
  end

  def test_should_be_false_because_not_exists_the_ran_word
    assert_not_equal true, @text.have_this_words?("ran busca".words, true)
  end

  # describe #not_have_this_words?
  def test_should_be_true_if_not_find_all_of_the_searched_words
    assert_equal true, @text.not_have_this_words?("ran busc".words, true)
  end
end
