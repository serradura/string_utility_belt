require 'string_utility_belt/regex_me'

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
          return false if not word_is_found_in_the_string?(word)
        end

        return true
      end

      private
      def word_is_found_in_the_string?(word)
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

    warn "StringUtilityBelt::General.have_this_words? will be deprecated in the next_version"
    def have_this_words?(words_to_match, options = nil)
      i = GENERAL.new(self)
      i.have_this_words?(words_to_match, options)
    end

    warn "StringUtilityBelt::General.not_have_this_words? will be deprecated in the next_version"
    def not_have_this_words?(words_to_match, options = nil)
      i = GENERAL.new(self)
      !i.have_this_words?(words_to_match, options)
    end
  end
end

class String
  include StringUtilityBelt::General
end
