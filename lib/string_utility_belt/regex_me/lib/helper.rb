# coding: utf-8
require File.dirname(__FILE__) + '/configurations'

module RegexMe
  class Helper
    include RegexMe::Configurations::Builder
    include RegexMe::Configurations::Variation
    include RegexMe::Configurations::Border

    attr_accessor :string

    def initialize(string = "")
      @string = string
    end

    def generate_for(env, options)
      @env = env
      @options = options_handler(options)

      regexp = factory

      case @env
      when :ruby
        options = [@options[:case_insensitive], @options[:multiline]].compact
        return Regexp.new(regexp, *options)
      when :mysql
        return regexp
      end
    end

    def set_latin_variations(string = nil)
      memo = ""
      text = string || @string

      text.each_char do |char|
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

      return text.replace(memo)
    end

    def builder(text, options)
      @text = text

      if options[:any]
        replace_the_any_char_per_any_pattern
      end

      if options[:latin_chars_variations]
        set_latin_variations(@text)
      end

      if options[:border]
        insert_border(options[:border])
      end

      if options[:or]
        insert_OR
      end

      return @text
    end

    private

    def options_handler(options)
      handled = \
        {:case_insensitive  => (options[:case_insensitive] ? Regexp::IGNORECASE : nil ),
          :multiline  => (options[:multiline] ? Regexp::MULTILINE : nil ),
          :or => (options[:or] == false ? false : true)}

      return options.merge(handled)
    end

    def factory
      lcv = @options[:latin_chars_variations]

      if @options[:exact_phrase]
        regexp = \
           set_latin_variations(@string.strip.unique_spaces) \
          .gsub(/\s/, WORDS_INTERVAL_PATTERN_FOR_EXACT_PHRASES)

        @regexp = \
           builder(regexp, :or => false,
                           :border => {:to => @env,
                                       :direction  => :both})
      else
        @regexp = '('

        for word in @string.strip.split
          if @options[:exact_word]
            @regexp << builder(word, :border => {:to => @env, :direction => :both},
                                     :latin_chars_variations => lcv,
                                     :or => true)

          elsif have_the_any_char?(word)
            @regexp << builder(word, :any => true,
                                     :border => border(@env, word),
                                     :latin_chars_variations => lcv,
                                     :or => true)

          else
            @regexp << builder(word, :latin_chars_variations => lcv,
                                     :or => true)
          end
        end

        @regexp = (@regexp << ')').sub!(/\|\)/,')')
      end

      return @regexp
    end

    def have_the_any_char?(string)
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

    def replace_the_any_char_per_any_pattern
      @text.gsub!(/\*/, '.*')
    end

    def insert_border(options)
      border = BORDER_TO[options[:to]]

      case options[:direction]
      when :left
        @text.insert(0, border[:left])
      when :right
        @text.insert(-1, border[:right])
      when :both
        @text.insert(0, border[:left]).insert(-1, border[:right])
      else
        @text
      end
    end

    def insert_OR
      @text.insert(-1, "|")
    end
  end
end
