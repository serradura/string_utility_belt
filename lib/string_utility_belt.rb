require "string_utility_belt/version"

require "general/general"
require "html_and_aml/html_and_aml"
require "match_rank/match_rank"
require "regex_me/regex_me"

module StringUtilityBelt

  include RegexMe::To::Search
  include MatchRank
  include General
  include HtmlAndAML

end

class String
  include StringUtilityBelt
end
