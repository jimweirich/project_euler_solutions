ANSWERS = [
  ['001',  233168],
  ['002', 4613732],
  ['003', 6857],
  ['004', 906609],
  ['005', 232792560],
  ['011', 70600674],
  ['016', 1366],
]

def check(prog, answer)
  start = Time.now
  actual = `ruby e#{prog}.rb`.to_i
  delta = Time.now - start
  if actual == answer
    puts "e#{prog}.rb: OK  (#{delta} seconds)"
  else
    puts "e#{prog}.rb:expected #{answer}, but got #{actual}  (#{delta} seconds)"
  end
end

ANSWERS.each do |prog, answer|
  check(prog, answer)
end

