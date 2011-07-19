require File.dirname(__FILE__) + '/helper'

module RegexMe
  module Builders

    warn "StringUtilityBelt::RegexMe::Builders.regex_me_to_search_ruby will be deprecated in the next_version"
    def regex_me_to_search_ruby(options = {})
      regex_me_to_search(:ruby, options)
    end


    warn "StringUtilityBelt::RegexMe::Builders.regex_me_to_search_mysql will be deprecated in the next_version"
    def regex_me_to_search_mysql(options = {})
      regex_me_to_search(:mysql, options)
    end

    private

    def regex_me_to_search(env, options)
      return EMPTYs[env] if self.strip.empty?

      RegexMe::Helper.new(self).generate_for(env, options)
    end
  end
end
