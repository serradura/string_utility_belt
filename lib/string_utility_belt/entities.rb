require 'htmlentities'

module StringUtilityBelt
  module Entities
    CODER = HTMLEntities.new

    def generate_entities
      CODER.encode(self)
    end

    def decode_entities
      CODER.decode(self)
    end

    warn "StringUtilityBelt::Entities.decode_entities_and_cleaner will be deprecated in the next_version"
    def decode_entities_and_cleaner
      decode_entities.tag_cleaner
    end
  end
end

class String
  include StringUtilityBelt::Entities
end
