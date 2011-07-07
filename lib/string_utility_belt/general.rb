require 'string_utility_belt/regex_me_to_search'

module StringUtilityBelt
  module General
    class GENERAL
      CASE_INSENSITIVE_OPT = {:case_insensitive => true}

      def have_this_words?(string, words_to_match, options)
        @string    = string
        @arguments = options

        for word in words_to_match
          return false if string_does_not_match_with_this_word_pattern?(word)
        end

        return true
      end

      private
      def string_does_not_match_with_this_word_pattern?(word)
        @string !~ word.regex_me_to_search_ruby(arguments)
      end

      def arguments
        if is_boolean?
          CASE_INSENSITIVE_OPT.merge({:exact_word => @arguments})
        elsif is_hash?
          @arguments.merge(CASE_INSENSITIVE_OPT)
        end
      end

      def is_boolean?
        @arguments.instance_of?(FalseClass) || @arguments.instance_of?(TrueClass)
      end

      def is_hash?
        @arguments.instance_of?(Hash)
      end
    end

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

    def have_this_words?(words_to_match, options = false)
      i = GENERAL.new
      i.have_this_words?(self, words_to_match, options)
    end

    def not_have_this_words?(words_to_match, options = false)
      i = GENERAL.new
      !i.have_this_words?(self, words_to_match, options)
    end
  end
end

class String
  include StringUtilityBelt::General
end
