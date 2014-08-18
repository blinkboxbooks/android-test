require 'active_support/inflector'

class String
  #@desc: added casing to the active_support #underscore method: converts a string to snake_case or SNAKE_CASE.
  #@example: "MyFirstClass".underscore_with_casing(:upper) --> "MY_FIRST_CLASS"
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
