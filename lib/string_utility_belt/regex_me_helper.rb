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
      self.gsub!(/\*/,'.*') if options[:any]

      regex_latin_ci_list if options[:latin_chars_variations]

      border_me(options[:border][:to],
                options[:border][:direction]) if options[:border]

      insert_OR if options[:or]

      return self
    end

    private

    def insert_OR
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
