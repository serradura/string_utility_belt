
module Tags

  def tag_cleaner
    self.gsub(/<\/?[^>]*>/, "")
  end

  def html_tag_cleaner
    # TAGs disponíveis até 09/2010 - FONTE: http://www.w3schools.com/tags/default.asp
    self.gsub(/<\/?(a|p|abbr|acronym|address|applet|area|b|base|basefont|bdo|big|blockquote|body|br|button|caption|center|cite|code|col|colgroup|dd|del|dfn|dir|div|dl|dt|em|fieldset|font|form|frame|frameset|h6|head|hr|html|i|iframe|img|input|ins|isindex|kbd|label|legend|li|link|map|menu|meta|noframes|noscript|object)[^>]+??>/im, "")
  end

end
