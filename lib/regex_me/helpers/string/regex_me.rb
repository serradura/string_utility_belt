
class String

  def regex_builder options={}
    self.gsub!(/\*/,'.*')                   if options[:any]
    border_me(options[:border][:to],
              options[:border][:direction]) if options[:border]
    insert_OR_in_right                  unless options[:delete_or]
    self
  end

  private
    def insert_OR_in_right
      self.insert(-1, "|")
    end

    def border_me border_to, direction
      border = define_border_metachar(border_to)

      case direction
        when :left
         self.insert(0, border[:left])
        when :right
         self.insert(-1, border[:right])
        when :both
         self.insert(0, border[:left]).insert(-1, border[:right])
        when nil
         self
      end
    end

    def define_border_metachar border_to
      case border_to
        when :ruby
          {:left => '\b'     , :right => '\b'}
        when :mysql
          {:left => '[[:<:]]', :right => '[[:>:]]'}
      end
    end

end