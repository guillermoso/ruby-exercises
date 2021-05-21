class JadenCase

  def initialize(string)
    @string = string

    validate
  end

  def convert
    @string.split.map(&:capitalize).join(" ")
  end

  def validate
    raise ArgumentError if !@string.is_a? String
  end

  # def self.convert(string)
  #   raise ArgumentError if !string.is_a? String
  #   return string if string.empty?

  #   string.split.map(&:capitalize).join(" ")
  # end
end
