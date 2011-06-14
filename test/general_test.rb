require 'rubygems' if RUBY_VERSION < '1.9'
require 'test/unit'
require 'general'

#before all
class String
  include General
end

class GeneralTest < Test::Unit::TestCase
  #describe #word
  def test_words_method
    assert %w{Ola}, "Ola".words
  end
end