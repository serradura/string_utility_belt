module StringUtilityBelt
  module Tags

    EMPTY_STR = ''

    TAG_PATTERN = /<\/?[^>]*>/

    # TAGs disponíveis até 09/2010 - FONTE: http://www.w3schools.com/tags/default.asp
    HTML_TAGS_PATTERN = /<\/?(a|p|abbr|acronym|address|applet|area|b|base|basefont|bdo|big|blockquote|body|br|button|caption|center|cite|code|col|colgroup|dd|del|dfn|dir|div|dl|dt|em|fieldset|font|form|frame|frameset|h6|head|hr|html|i|iframe|img|input|ins|isindex|kbd|label|legend|li|link|map|menu|meta|noframes|noscript|object)[^>]+??>/im


    def tag_cleaner
      self.gsub(TAG_PATTERN, EMPTY_STR)
    end

    def html_tag_cleaner
      self.gsub(HTML_TAGS, EMPTY_STR)
    end

  end
end

class String
  include StringUtilityBelt::Tags
end
