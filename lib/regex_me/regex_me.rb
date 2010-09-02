
require File.join(File.dirname(__FILE__), "helpers", "string", "regex_me")

module RegexMe

  module To

    module Search

      private
        def options_handler options
           {
            :exact_word       =>  options[:exact_word],
            :case_insensitive => (options[:case_insensitive] ? :i : nil ),
            :m                => (options[:m] ? :m : nil ),
            :exact_phrase     =>  options[:exact_phrase]
           }
        end

      private
        def regex_me_to_search regex_empty, border_to, options
            opt_handled = options_handler(options)

            return regex_empty if self.strip.empty?
            execute_builder(self, opt_handled, border_to)
        end


      public
        def regex_me_to_search_ruby options={}
            regex_me_to_search(//, :ruby, options)
        end

        def regex_me_to_search_mysql options={}
            regex_me_to_search("", :mysql, options)
        end

      private
        def execute_builder string, opt_handled, border_to
          result_builder = builder(string, opt_handled[:exact_word], border_to, opt_handled[:exact_phrase])

          case border_to
            when :ruby
              eval "/#{result_builder}/#{opt_handled[:case_insensitive]}#{opt_handled[:m]}"
            when :mysql
              result_builder.gsub(/\\b/,"[[:<:]]").gsub(/\\b$/, "[[:>:]])")
          end

        end

        def builder string, exact_word, border_to, exact_phrase

          if exact_phrase
            regexp = string.gsub(/\s+/, " ").gsub(/\s/, '[^0-9a-zA-Z\_]+').regex_builder(:delete_or => true, :border => {:to => border_to, :direction => :both})
          else
            regexp = '('

            for word in string.strip.split
              case word
                when/^\*/
                  regexp << word.regex_builder(:any => true, :border => {:to => border_to, :direction => :right})
                when /\*$/
                  regexp << word.regex_builder(:any => true, :border => {:to => border_to, :direction => :left})
                when /^.*\*.*$/
                  regexp << word.regex_builder(:any => true, :border => {:to => border_to, :direction => :both})
                else
                  regexp << (exact_word ? word.regex_builder(:border => {:to => border_to, :direction => :both}) : word.regex_builder)
              end
            end

            regexp = (regexp << ')').sub!(/\|\)/,')')
          end

          return regexp
        end

    end

  end

end