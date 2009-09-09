require 'primes'

class Integer

  def divisors
    result = []
    i = 1
    while i*i <= self
      if self%i == 0
        result << i
        result << self/i if i*i != self
      end
      i += 1
    end
    result.sort
  end

  PRIMES = Primes.new(100_000)

  def prime_factors
    n = self
    i = 0
    v = []
    while n > 1
      c = 0
      while n % PRIMES[i] == 0
        n = n / PRIMES[i]
        c += 1
      end
      v << c
      i += 1
    end
    v
  end

  def divisor_count
    prime_factors.inject(1) { |r, n| r * (n+1) }
  end

end
