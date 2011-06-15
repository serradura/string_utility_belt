require 'string_utility_belt/version'

require 'regex_me'
require 'general'
require 'html_and_aml/html_and_aml'
require 'match_rank/match_rank'

module StringUtilityBelt
  include MatchRank
  include HtmlAndAML
end

class String
  include StringUtilityBelt
end
