require 'string_utility_belt/regex_me_helper'

module RegexMe
  module To
    module Search

      # PUBLIC METHODS Don't need to set public
      # Just Write below:
      
      def regex_me_to_search_ruby options={}
          regex_me_to_search(//, :ruby, options)
      end

      def regex_me_to_search_mysql options={}
          regex_me_to_search("", :mysql, options)
      end


      private
        def options_handler options
           {
            :exact_word            => options[:exact_word],
            :case_insensitive      => (options[:case_insensitive] ? :i : nil ),
            :latin_chars_variation => options[:latin_chars_variation],
            :m                     => (options[:m] ? :m : nil ),
            :exact_phrase          => options[:exact_phrase]
           }
        end

      private
        def regex_me_to_search regex_empty, border_to, options
            opt_handled = options_handler(options)

            return regex_empty if self.strip.empty?
            execute_builder(self, opt_handled, border_to)
        end

      private
        def execute_builder string, opt_handled, border_to
          result_builder = builder(string, opt_handled[:exact_word], border_to, opt_handled[:latin_chars_variation], opt_handled[:exact_phrase])

          case border_to
            when :ruby
              eval "/#{result_builder}/#{opt_handled[:case_insensitive]}#{opt_handled[:m]}"
            when :mysql
              result_builder.gsub(/\\b/,"[[:<:]]").gsub(/\\b$/, "[[:>:]])")
          end

        end

        def builder string, exact_word, border_to, latin_chars_variation, exact_phrase

          if exact_phrase
            regexp = string.gsub(/\s+/, " ").regex_latin_ci_list.gsub(/\s/, '[^0-9a-zA-Z\_]+').regex_builder(:delete_or => true,
                                                                                         :border => {:to => border_to,
                                                                                         :direction => :both})
          else
            regexp = '('

            for word in string.strip.split
              case word
                when/^\*/
                  regexp << word.regex_builder(:any => true, :border => {:to => border_to, :direction => :right}, :latin_chars_variation => latin_chars_variation)
                when /\*$/
                  regexp << word.regex_builder(:any => true, :border => {:to => border_to, :direction => :left}, :latin_chars_variation => latin_chars_variation)
                when /^.*\*.*$/
                  regexp << word.regex_builder(:any => true, :border => {:to => border_to, :direction => :both}, :latin_chars_variation => latin_chars_variation)
                else
                  regexp << (exact_word ? word.regex_builder(:border => {:to => border_to, :direction => :both}, :latin_chars_variation => latin_chars_variation) : word.regex_builder(:latin_chars_variation => latin_chars_variation))
              end
            end

            regexp = (regexp << ')').sub!(/\|\)/,')')
          end

          return regexp
        end

    end

  end

end