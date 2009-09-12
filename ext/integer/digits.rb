class Integer
  def digits
    result = []
    n = self
    while n > 0
      result << n%10
      n = n / 10
    end
    result
  end
end
