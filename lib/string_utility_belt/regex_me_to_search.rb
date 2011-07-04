require 'string_utility_belt/regex_me_helper'

module StringUtilityBelt
  module RegexMe
    EMPTYs = {:ruby => //, :mysql => ''}
    WORDS_INTERVAL_PATTERN_FOR_EXACT_PHRASES = '[^0-9a-zA-Z\_]+'

    module To
      module Search
        def regex_me_to_search_ruby(options = {})
          regex_me_to_search(:ruby, options)
        end

        def regex_me_to_search_mysql(options = {})
          regex_me_to_search(:mysql, options)
        end

        private

        def options_handler(options)
          handled = \
          {:case_insensitive  => (options[:case_insensitive] ? :i : nil ),
           :m  => (options[:m] ? :m : nil ),
           :or => (options[:or] == false ? false : true)}

          return options.merge(handled)
        end

        def regex_me_to_search(env, options)
          return EMPTYs[env] if self.strip.empty?

          execute_builder(env, options)
        end

        def execute_builder(env, options)
          opt_handled = options_handler(options)
          string      = self

          builder_result = builder(string, env, opt_handled)

          case env
          when :ruby
            eval "/#{builder_result}/#{opt_handled[:case_insensitive]}#{opt_handled[:m]}"
          when :mysql
            builder_result.gsub(/\\b/,"[[:<:]]").gsub(/\\b$/, "[[:>:]])")
          end
        end

        def builder(string, border_to, options)
          lcv = options[:latin_chars_variations]

          if options[:exact_phrase]
            @regexp = \
              string \
               .strip.simple_space \
               .gsub(/\s/, WORDS_INTERVAL_PATTERN_FOR_EXACT_PHRASES) \
               .regex_builder(:or => false,
                              :border => {:to => border_to,
                                          :direction  => :both},
                              :latin_chars_variations => true)
          else
            @regexp = '('

            for word in string.strip.split
              if options[:exact_word]
                @regexp << word.regex_builder(:border => {:to => border_to, :direction => :both}, :latin_chars_variations => lcv, :or => true)
              elsif have_any_metachar?(word)
                @regexp << word.regex_builder(:any => true, :border => border(border_to, word) , :latin_chars_variations => lcv, :or => true)
              else
                @regexp << word.regex_builder(:latin_chars_variations => lcv, :or => true)
              end
            end

            @regexp = (@regexp << ')').sub!(/\|\)/,')')
          end

          return @regexp
        end

       def have_any_metachar?(string)
         string.include?('*')
       end

        def border(to, word)
          direction = nil

          case word
          when/^\*/
            direction = :right
          when /\*$/
            direction = :left
          when /^.*\*.*$/
            direction = :both
          end

          {:to => to, :direction => direction}
        end
      end
    end
  end
end

class String
  include StringUtilityBelt::RegexMe::To::Search
end
