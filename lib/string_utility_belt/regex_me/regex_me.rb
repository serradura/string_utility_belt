require File.dirname(__FILE__) + '/lib/builders.rb'

class String
  include RegexMe::Builders
end
