require File.join(File.dirname(__FILE__), '..', 'test_helper')
require File.join('string_utility_belt', 'commons')
require File.join('string_utility_belt', 'regex_me')
require File.join('string_utility_belt', 'match_rank')

class MatchRankTest < Test::Unit::TestCase

  def setup
    @sequence = "a aa aaa aaaa aaaaa b bb bbb bbbb"
  end

  def test_should_return_a_hash_with_the_results_of_exact_and_inexact_matches
    analysis = "".total_frequency_by('test')
    expected = {:exact => 0, :matched => 0}
    assert_equal(expected, analysis)
  end

  def test_should_return_how_many_times_a_text_pattern_was_matched
    analysis = @sequence.total_frequency_by('bb')
    matched = analysis[:matched]
    assert_equal 3, matched
  end

  def test_should_return_how_many_exact_matches
    analysis = @sequence.total_frequency_by('bb')
    exact_matches = analysis[:exact]
    assert_equal(1, exact_matches)
  end

  def test_should_return_an_analysis_of_all_received_words
    analysis = @sequence.total_frequency_by('aa bb'.words)
    expected = {:matched=> 7, :exact=> 2}
    assert_equal(expected, analysis)
  end

  def test_should_return_the_analysis_of_total_frequency_by_method_and_precision
    analysis = @sequence.match_and_score_by('aa bb'.words)
    expected = {:exact=>2.0, :matched=>7.0, :precision=>28.5714285714286}
    assert_in_delta(expected[:precision], analysis[:precision], 0.00001)
  end


  def test_should_return_a_hash_with_the_results_for_exact_and_inexact_per_word_criteria
    analysis = "".words_frequency_by('test')
    expected = {:exact => {}, :matched => {}}
    assert_equal(expected, analysis)
  end

  def test_should_return_how_many_times_a_text_pattern_was_matched_per_word_criteria
    analysis = @sequence.words_frequency_by('aa')
    matched = analysis[:matched]
    assert_equal({'aa' => 4}, matched)
  end

  def test_should_return_how_many_exact_matches_per_word_criteria
    analysis = @sequence.words_frequency_by('aa')
    exact_matches = analysis[:exact]
    assert_equal({'aa' => 1}, exact_matches)
  end

  def test_should_return_an_analysis_of_all_received_words_per_words_criteria
    analysis = @sequence.words_frequency_by('aa bb'.words)
    expected = {:matched=>{"bb"=>3, "aa"=>4}, :exact=>{"bb"=>1, "aa"=>1}}
    assert_equal(expected, analysis)
  end

end
