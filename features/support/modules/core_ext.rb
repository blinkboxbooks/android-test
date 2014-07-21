require 'active_support/inflector'

class String
  #@desc: converts a string to snake_case or SNAKE_CASE.
  #@example: "MyFirstClass" --> "my_first_class"
  def underscore_with_casing(casing = :lower)
    s = self.underscore
    case casing
      when :lower then
        s
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