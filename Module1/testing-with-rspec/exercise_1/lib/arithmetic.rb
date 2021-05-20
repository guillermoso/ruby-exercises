class Arithmetic
  def self.sum(*args)
    args.reduce(:+).truncate(2)
  end

  def self.substract(*args)
    args.reduce(:-).truncate(2)
  end

  def self.multiply(*args)
    args.reduce(:*).truncate(2)
  end

  def self.divide(*args)
    raise ZeroDivisionError if args.include?(0) || args.include?(0.0)

    args.map(&:to_f).reduce(:/).truncate(2)
  end
end
