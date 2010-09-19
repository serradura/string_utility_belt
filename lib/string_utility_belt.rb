
['entities', 'general', 'regex_me_to_search', 'tags', 'match_rank', 'html_and_aml'].each do |file|
  require "string_utility_belt/#{file}"
end

module StringUtilityBelt
  include RegexMe::To::Search
  include MatchRank
  include General
  include HtmlAndAML
end

class String
	include StringUtilityBelt
end
