require 'string_utility_belt/regex_me_to_search'

module StringUtilityBelt
  module General
    class GENERAL
      CASE_INSENSITIVE_OPT = {:case_insensitive => true}

      def initialize(string)
        @string = string
      end

      def have_this_words?(words_to_match, options)
        @arguments = options

        for word in words_to_match
          return false if not found_word_in_string?(word)
        end

        return true
      end

      private
      def found_word_in_string?(word)
        @string =~ word.regex_me_to_search_ruby(arguments)
      end

      def arguments
        if args_is_nil? or args_is_boolean?
          CASE_INSENSITIVE_OPT.merge({:exact_word => @arguments})
        elsif args_is_hash?
          @arguments.merge(CASE_INSENSITIVE_OPT)
        end
      end

      def args_is_boolean?
        @arguments.instance_of?(FalseClass) || @arguments.instance_of?(TrueClass)
      end

      def args_is_hash?
        @arguments.instance_of?(Hash)
      end

      def args_is_nil?
        @arguments.nil?
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

    def have_this_words?(words_to_match, options = nil)
      i = GENERAL.new(self)
      i.have_this_words?(words_to_match, options)
    end

    def not_have_this_words?(words_to_match, options = nil)
      i = GENERAL.new(self)
      !i.have_this_words?(words_to_match, options)
    end
  end
end

class String
  include StringUtilityBelt::General
end
