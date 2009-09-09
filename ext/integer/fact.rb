class Integer
  def fact
    (2..self).inject(1) { |r, i| r*i }
  end
end
