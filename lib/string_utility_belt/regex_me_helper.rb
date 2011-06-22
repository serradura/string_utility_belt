# coding: utf-8

module RegexMe
  module Helper
    LATIN_CHARS_VARIATION = ["[aàáâãä]", "[eèéêë]", "[iìíîï]", "[oòóôõö]", "[uùúûü]", "[cç]", "[nñ]"]

    def regex_latin_ci_list
      memo = ""
      self.each_char do |char|

        variation_found = false

        for char_variation in LATIN_CHARS_VARIATION
          match = eval("/#{char_variation}/")

          if (char =~ match)
            memo.insert(-1, char_variation)
            variation_found = true
            break
          end
        end

        memo.insert(-1, char) unless variation_found
      end

      self.replace(memo)
    end

    def regex_builder options={}
      self.gsub!(/\*/,'.*') if options[:any]

      regex_latin_ci_list if options[:latin_chars_variation]

      border_me(options[:border][:to],
                options[:border][:direction]) if options[:border]

      insert_OR_in_right unless options[:delete_or]

      return self
    end

    private

    def insert_OR_in_right
      self.insert(-1, "|")
    end

    def border_me border_to, direction
      border = define_border_metachar(border_to)

      case direction
      when :left
        self.insert(0, border[:left])
      when :right
        self.insert(-1, border[:right])
      when :both
        self.insert(0, border[:left]).insert(-1, border[:right])
      when nil
        self
      end
    end

    def define_border_metachar border_to
      case border_to
      when :ruby
        {:left => '\b'     , :right => '\b'}
      when :mysql
        {:left => '[[:<:]]', :right => '[[:>:]]'}
      end
    end
  end
end

class String
  include RegexMe::Helper
end
