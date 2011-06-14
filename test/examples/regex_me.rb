$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', '..', 'lib'))

require "string_utility_belt"

label = "rodrigo    Serradura"
content = "Meu nome é Rodrigo Serradura Marques Rodrigues"
content2 = "Meu nome é Rodrigo \"The\" Serradura Marques Rodrigues"
puts !!(content  =~ label.regex_me_to_search_ruby(:exact_phrase => true, :case_insensitive => true))
puts !!(content2  =~ label.regex_me_to_search_ruby(:exact_phrase => true, :case_insensitive => true))

puts ""

p label.regex_me_to_search_mysql(:exact_phrase => true, :case_insensitive => true)
p "gato pato rato r* *a b*n*a".regex_me_to_search_mysql

puts ""

p label.regex_me_to_search_ruby(:exact_phrase => true, :case_insensitive => true)
p "gato pato rato r* *a b*n*a".regex_me_to_search_ruby

p label.regex_me_to_search_ruby(:exact_phrase => true, :case_insensitive => true)

puts ""

p "gato pato rato r* *a b*n*a".regex_me_to_search_ruby(:latin_chars_variation => true)
p "Vale sepetiba".regex_me_to_search_mysql(:latin_chars_variation => true, :exact_phrase => true)

p "estágio".regex_me_to_search_ruby(:latin_chars_variation => true)
