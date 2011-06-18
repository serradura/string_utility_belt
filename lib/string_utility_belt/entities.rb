begin
  require 'htmlentities'
rescue LoadError
  require 'rubygems' # There are people that don't use rubygems! Require rubygems is the last alternative.
  require 'htmlentities'
end

module StringUtilityBelt
  module Entities
    CODER = HTMLEntities.new

    def generate_entities
      CODER.encode(self)
    end

    def decode_entities
      CODER.decode(self)
    end

    def decode_entities_and_cleaner
      decode_entities.tag_cleaner
    end
  end
end

class String
  include StringUtilityBelt::Entities
end
