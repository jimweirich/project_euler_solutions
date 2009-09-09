class Primes
  include Enumerable
  
  attr_reader :current
  
  def initialize
    @primes = []
  end
  
  def next_prime
    @current ||= 1
    @current += 1
    while @primes.any? { |p| (current % p) == 0 }
      @current += 1
    end
    @primes << @current
    @current
  end

  def primes(n)
    (1..n).map { next_prime }
  end

  def while()
    result = []
    next_prime
    while yield(current )
      result << current
      next_prime
    end
    result
  end
end
