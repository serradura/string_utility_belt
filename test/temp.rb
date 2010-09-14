
class String
  def simple_space
    self.strip.gsub(/\s+/, " ")
  end

  def simple_space!
    self.strip.gsub!(/\s+/, " ")
  end
end

puts "Rodrigo                 aaaaaaaaaaaaaaaa      \n\n\n\ \r \t\t\t\t Serradura             ".simple_space