#!/usr/bin/env ruby

ANSWERS = {
  '001' => 233168,
  '002' => 4613732,
  '003' => 6857,
  '004' => 906609,
  '005' => 232792560,
  '011' => 70600674,
  '016' => 1366,
}

def check(prog, answer)
  start = Time.now
  actual = `ruby e#{prog}.rb`.to_i
  delta = Time.now - start
  if actual == answer
    printf "e#{prog}.rb: %20d    OK  (%0.3f seconds)\n", answer, delta
  else
    puts "e#{prog}.rb: expected #{answer}, but got #{actual}  (#{delta} seconds)"
  end
end

if ARGV.empty?
  ANSWERS.keys.each do |prog|
    answer = ANSWERS[prog]
    check(prog, answer)
  end
else
  prog = "%03d" % ARGV.first.to_i
  check(prog, ANSWERS[prog])
end
