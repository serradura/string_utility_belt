
require "rubygems" if RUBY_VERSION < "1.9"
require "htmlentities"

module Entities

  def decode_entities
    coder = HTMLEntities.new
    coder.decode(self)
  end

  def decode_entities_and_cleaner
    decode_entities.tag_cleaner
  end

end