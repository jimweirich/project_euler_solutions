#!/usr/bin/env ruby

ANSWERS = {
  '001' => 233168,
  '002' => 4613732,
  '003' => 6857,
  '004' => 906609,
  '005' => 232792560,
  '006' => 25164150,
  '007' => 104743,
  '008' => 40824,
  '009' => 31875000,
  '010' => 142913828922,
  '011' => 70600674,
  '012' => 76576500,
  '013' => 5537376230,
  '014' => 837799,
  '015' => 137846528820,
  '016' => 1366,
  '017' => 21124,
  '018' => 1074,
  '019' => 171,
  '020' => 648,
  '021' => 31626,
  '022' => 871198282,
  '023' => 4179871,
  '024' => 2783915460,
  '025' => 4782,
  '028' => 669171001,
  '067' => 7273,
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
  ANSWERS.keys.sort.each do |prog|
    answer = ANSWERS[prog]
    check(prog, answer)
  end
else
  prog = "%03d" % ARGV.first.to_i
  check(prog, ANSWERS[prog])
end
