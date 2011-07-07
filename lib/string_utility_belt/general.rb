require 'string_utility_belt/regex_me_to_search'

module StringUtilityBelt
  module General

    WORD_PATTERN      = /\w[\w\'\-]*/
    ANY_SPACE_PATTERN = /\s+/

    SIMPLE_SPACE = " "

    def words
      self.scan(WORD_PATTERN)
    end

    def simple_space
      self.gsub(ANY_SPACE_PATTERN, SIMPLE_SPACE)
    end

    def simple_space!
      self.gsub!(ANY_SPACE_PATTERN, SIMPLE_SPACE)
    end

    def have_this_words? words_to_match, exact_word=false
      helper_have_this_words?( words_to_match, exact_word)
    end

    def not_have_this_words? words_to_match, exact_word=false
      !helper_have_this_words?(words_to_match, exact_word)
    end

    private

    def helper_have_this_words? words_to_match, exact_word
      for word in words_to_match
        return false if (self !~ word.regex_me_to_search_ruby(:exact_word => exact_word, :case_insensitive => true))
      end
      return true
    end
  end
end

class String
  include StringUtilityBelt::General
end
