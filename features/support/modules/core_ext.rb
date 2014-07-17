class String
  #@desc: converts a string to snake_case or SNAKE_CASE.
  #@example: "MyFirstClass" --> "my_first_class"
  def camel_case_to_snake_case(casing = :lower)
    s = self.gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').
        gsub(/([a-z\d])([A-Z])/, '\1_\2').
        tr('-', '_')
    case casing
      when :lower then
        s.downcase
      when :upper then
        s.upcase
      else
        raise ArgumentError, "unsupported casing"
    end
  end

  #@example: "home page" --> "HomePage"
  def to_class_name
    to_s.gsub('&', 'and').gsub(/[\- ]/, '_').camelize(:upper)
  end
end