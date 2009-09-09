class Primes
  include Enumerable
  
  attr_reader :current
  
  def initialize(max=10001)
    @sieve = [false] * max
    @primes = []
  end
  
  def next_prime
    @current ||= 1
    @current += 1
    while @sieve[@current]
      @current += 1
    end
    fail "Out of primes (#{@sieve.size})" if @current >= @sieve.size
    @primes << @current
    mark_current
    @current
  end

  def [](index)
    while @primes.size <= index
      next_prime
    end
    @primes[index]
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

  private

  def mark_current
    n = @current
    while n < @sieve.size
      @sieve[n] = true
      n += @current
    end
  end
end
