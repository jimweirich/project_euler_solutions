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

  def divisor_count
    result = 0
    i = 1
    while i*i <= self
      if self%i == 0
        result += 1
        result += 1 if i*i != self
      end
      i += 1
    end
    result
  end

end
