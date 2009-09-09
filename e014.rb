#!/usr/bin/env ruby

#N = 1_000
N = 1_000_000
MAX_MEMO = N+1
MEMO = [0, 1]

def wonder_size(n)
  fill_memo(n) if MEMO[n].nil?
  MEMO[n]
rescue IndexError => ex
  STDERR.puts "FAILED: MEMO exhausted with #{n}"
end

def fill_memo(n)
  crumbs = []
  i = n
  count = 1
  while (i > MAX_MEMO) || MEMO[i].nil?
    crumbs << i
    count += 1
    if i%2 == 0
      i = i / 2
    else
      i = 3 * i + 1
    end
  end
  x = MEMO[i]
  crumbs.reverse.each do |c|
    x += 1
    MEMO[c] = x if c < MAX_MEMO
  end
end

answer = 1
answer_size = 1
(2..N).each do |n|
  n_size = wonder_size(n)
  if n_size > answer_size
    answer_size = n_size
    answer = n
  end
end
p answer
