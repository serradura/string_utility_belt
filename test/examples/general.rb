$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', '..', 'lib'))

require "string_utility_belt"

text = %q{Texto de teste!
Esta classe deverá fazer a busca por uma ou um grupo de palavras
em um texto e retornar um rank com a quantidade identificada.}

puts text.have_this_words?("busca ran".words)
puts text.have_this_words?("ran busca".words)

puts ""

puts text.have_this_words?("busca ran".words, true)
puts text.have_this_words?("ran busca".words, true)

puts ""

puts text.not_have_this_words?("buscar ran".words, true)

puts ""

p text.match_and_score_by("busca rank um".words)

puts ""

p text.words_frequency_by("um a".words)
p text.total_frequency_by("um a".words)


