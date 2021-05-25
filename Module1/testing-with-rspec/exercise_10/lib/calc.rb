require 'prime'
module Calc
  class << self
    def add(*args)
      args.reduce(:+)
    end

    def sub(a, b)
      a - b
    end

    def mul(*args)
      args.reduce(:*)
    end

    def div(a, b)
      a.to_f / b.to_f
    end

    def factors(n)
      factors = []
      n.times do |i|
        i += 1

        factors << i if (n % i).zero?
      end

      factors
    end

    def prime(n)
      return false if n <= 1

      prime = true
      n.times do |x|
        x += 1
        next if x == 1 || x == n

        prime = false if (n % x).zero?
      end

      prime
    end

    def primes_in_range(first, last)
      (first..last).select { |n| prime(n) }
    end
  end
end
