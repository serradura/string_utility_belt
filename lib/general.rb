
module General

  def words
    self.scan(/\w[\w\'\-]*/)
  end

  def simple_space
    self.strip.gsub(/\s+/, " ")
  end

  def simple_space!
    begin
      self.strip!.gsub!(/\s+/, " ")
    rescue NoMethodError
      # O erro foi gerado porque strip! nao encontrou espacos
      # e netornou nil e nil nao tem o metodo gsub!
      return nil
    end
  end

  def have_this_words? words_to_match, exact_word=false
    helper_have_this_words? words_to_match, exact_word do |string, word, exact_world|
      return false if (string !~ word.regex_me_to_search_ruby(:exact_word => exact_word, :case_insensitive => true))
    end
  end

  def not_have_this_words? words_to_match, exact_word=false
    helper_have_this_words? words_to_match, exact_word do |string, word, exact_world|
      return false if (string =~ word.regex_me_to_search_ruby(:exact_word => exact_word, :case_insensitive => true))
    end
  end

  private
    def helper_have_this_words? words_to_match, exact_word
      for word in words_to_match
        yield self, word, exact_word
      end
      return true
    end

end
