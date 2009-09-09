class Integer
  TEENS = [
    4, 3, 3, 5, 4, 4, 3, 5, 5, 4,
    3, 6, 6, 8, 8, 7, 7, 9, 8, 8
  ]

  TENS = [0, 0, 6, 6, 5, 5, 5, 7, 6, 6]

  def english_size
    fail "#{self} too large for the English language" if self > 1000
    if self == 1000
      11
    else
      huns = self / 100
      tens = self % 100
      if huns == 0
        tens.english_under_100_size
      elsif tens == 0
        huns.english_under_100_size + 7
      else
        huns.english_under_100_size + 10 + tens.english_under_100_size
      end
    end
  end

  def english_under_100_size
    if self < 20
      TEENS[self]
    else
      tens = self / 10
      ones = self % 10
      result = TENS[tens]
      result += TEENS[ones] if ones > 0
      result
    end
  end

  
end
