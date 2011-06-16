require 'string_utility_belt/regex_me_to_search'

module StringUtilityBelt
  module MatchRank

    def match_and_score_by words_to_match
      freq = self.total_frequency_by words_to_match
      statistic = {:exact => freq[:exact].to_f, :matched => freq[:matched].to_f, :precision => 0.0}

      statistic[:precision] = (statistic[:exact] / statistic[:matched]) * 100

      return statistic
    end

    def words_frequency_by words_to_match
      frequency_by(words_to_match, Hash.new(0), Hash.new(0)) do |freq, word_to_match, word|
        freq[:exact][word_to_match]   += 1 if word =~ word_to_match.regex_me_to_search_ruby(:exact_word => true  , :case_insensitive => true)
        freq[:matched][word_to_match] += 1 if word =~ word_to_match.regex_me_to_search_ruby(:exact_word => false , :case_insensitive => true)
      end
    end

    def total_frequency_by words_to_match
      frequency_by(words_to_match, 0, 0) do |freq, word_to_match, word|
        freq[:exact]   += 1 if word =~ word_to_match.regex_me_to_search_ruby(:exact_word => true  , :case_insensitive => true)
        freq[:matched] += 1 if word =~ word_to_match.regex_me_to_search_ruby(:exact_word => false , :case_insensitive => true)
      end
    end

    private

    def frequency_by words_to_match, frequency_object_a, frequency_object_b
      self_words = self.words
      freq = {:exact => frequency_object_a, :matched => frequency_object_b}

      for word_to_match in words_to_match
        for word in self_words
          yield freq, word_to_match, word
        end
      end

      return freq
    end

  end
end

class String
  include StringUtilityBelt::MatchRank
end
