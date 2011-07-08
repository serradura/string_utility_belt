require 'string_utility_belt/regex_me_to_search'

module StringUtilityBelt
  module MatchRank
    class MATCHRANK
      TOTAL_TEMPLATE = {:exact => 0, :matched => 0}
      SCORE_TEMPLATE = TOTAL_TEMPLATE.merge({:precision => 0})

      def initialize(string)
        @text = string
      end

      def frequency(options)
        @options = options
        @result  = result_template

        for @search_word in search_words
          for @text_word in @text.words
            count_exact_matches
            count_fragmet_matches
          end
        end

        calculate_the_precision if @options[:template] == :precision

        return @result
      end

      private

      def search_words
        words = @options[:search_words]
        words.instance_of?(Array) ? words : words.to_s.words
      end

      def count_exact_matches
        incr_result(:exact) if find_the_wanted_word(:with_precision => true)
      end

      def count_fragmet_matches
        incr_result(:matched) if find_the_wanted_word(:with_precision => false)
      end

      def calculate_the_precision
        @result[:precision] = (@result[:exact].to_f / @result[:matched].to_f) * 100
      end

      def find_the_wanted_word(option)
        @text_word =~ matcher(option[:with_precision])
      end

      def matcher(precision)
        @search_word.regex_me_to_search_ruby(:exact_word => precision,
                                             :case_insensitive => true)
      end

      def incr_result(key)
        case @options[:template]
        when :grouped_words
          begin
            @result[key][@search_word] += 1
          rescue
            @result[key][@search_word] = 0
            @result[key][@search_word] += 1
          end
        else
          @result[key] += 1
        end
      end

      def result_template
        templates.fetch(@options[:template]).clone
      end

      def templates
        {
         :total => TOTAL_TEMPLATE,
         :precision => SCORE_TEMPLATE,
         :grouped_words => {:exact => {}, :matched => {}}
        }
      end
    end

    def total_frequency_by(words)
      measure.frequency(:template => :total, :search_words => words)
    end

    def words_frequency_by(words)
      measure.frequency(:template => :grouped_words, :search_words => words)
    end

    def match_and_score_by(words)
      measure.frequency(:template => :precision, :search_words => words)
    end

    private

    def measure
      MATCHRANK.new(self)
    end
  end
end

class String
  include StringUtilityBelt::MatchRank
end
