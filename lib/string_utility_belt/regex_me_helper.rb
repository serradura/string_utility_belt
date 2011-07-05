# coding: utf-8

module RegexMe
  module Helper
    A_VARIATIONS = "[aàáâãä]"
    E_VARIATIONS = "[eèéêë]"
    I_VARIATIONS = "[iìíîï]"
    O_VARIATIONS = "[oòóôõö]"
    U_VARIATIONS = "[uùúûü]"
    C_VARIATIONS = "[cç]"
    N_VARIATIONS = "[nñ]"

    LATIN_CHARS_VARIATIONS = [A_VARIATIONS,
                              E_VARIATIONS,
                              I_VARIATIONS,
                              O_VARIATIONS,
                              U_VARIATIONS,
                              C_VARIATIONS,
                              N_VARIATIONS]

   BORDER_TO = {
                 :ruby => {:left => '\b', :right => '\b' },
                 :mysql => {:left => '[[:<:]]', :right => '[[:>:]]' }
               }

    def regex_latin_ci_list
      memo = ""

      self.each_char do |char|
        changed = false

        for variations in LATIN_CHARS_VARIATIONS
          variations_pattern = Regexp.new(variations, Regexp::IGNORECASE)

          if char =~ variations_pattern
            changed = true
            memo.insert(-1, variations)
            break
          end
        end

        memo.insert(-1, char) unless changed
      end

      self.replace(memo)
    end

    def regex_builder(options)
      if options[:any]
        replace_the_any_char_per_any_pattern
      end

      if options[:latin_chars_variations]
        replace_chars_includeds_in_latin_variation_list
      end

      if options[:border]
        insert_border(options[:border])
      end

      if options[:or]
        insert_OR
      end

      return self
    end

    private
    def replace_the_any_char_per_any_pattern
      self.gsub!(/\*/, '.*')
    end

    def replace_chars_includeds_in_latin_variation_list
      self.regex_latin_ci_list
    end

    def insert_border(options)
      border = BORDER_TO[options[:to]]

      case options[:direction]
      when :left
        self.insert(0, border[:left])
      when :right
        self.insert(-1, border[:right])
      when :both
        self.insert(0, border[:left]).insert(-1, border[:right])
      else
        self
      end
    end

    def insert_OR
      self.insert(-1, "|")
    end
  end
end

class String
  include RegexMe::Helper
end
