module RegexMe
  module Configurations
    module Builder
      EMPTYs = {:ruby => //, :mysql => ''}
      WORDS_INTERVAL_PATTERN_FOR_EXACT_PHRASES = '[^0-9a-zA-Z\_]+'
    end

    module Variation
      A_VARIATIONS = "(a|à|á|â|ã|ä)"
      E_VARIATIONS = "(e|è|é|ê|ë)"
      I_VARIATIONS = "(i|ì|í|î|ï)"
      O_VARIATIONS = "(o|ò|ó|ô|õ|ö)"
      U_VARIATIONS = "(u|ù|ú|û|ü)"
      C_VARIATIONS = "(c|ç)"
      N_VARIATIONS = "(n|ñ)"

      LATIN_CHARS_VARIATIONS = [A_VARIATIONS,
                                E_VARIATIONS,
                                I_VARIATIONS,
                                O_VARIATIONS,
                                U_VARIATIONS,
                                C_VARIATIONS,
                                N_VARIATIONS]
    end

    module Border
      BORDER_TO = {
        :ruby  => {:left => '\b', :right => '\b' },
        :mysql => {:left => '[[:<:]]', :right => '[[:>:]]' }
      }
    end
  end
end


