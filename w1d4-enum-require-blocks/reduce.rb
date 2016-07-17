# MAXIMUM

# maximum (w/ reduce)

a = [1,2,3,4,5]
result = a.reduce do |max, x|
  x > max ? x : max
end

# maximum (w/o reduce)

a = [1,2,3,4,5]
max = a.first
[2,3,4,5].each do |x|
 if x > max
   max = x
 end
end
result = max

# SUM

# sum (w/o init value)

sum = [1,2,3,4,5].reduce do |memo, x|
  memo + x
end

# sum (w/ init value)

sum = [1,2,3,4,5].reduce(0) do |memo, x|
  memo + x
end

# sum (w/o reduce)

sum = 0
[1,2,3,4].each do |x|
 sum += x
end

# SELECT w/ reduce

[1,2,3,4,5].reduce([]) do |memo, x|
  x % 2 == 0 ? memo.push(x) : memo
end

# CHAR COUNTING w/ reduce

s = "aoiahsdgoihsdgoihsoihsadgoihas"

# using a hash with a default value

s.chars.reduce(Hash.new(0)) do |memo, x|
  memo[x] += 1
end

# using a hash w/ no default and using ||=

s.chars.reduce({}) do |memo, x|
  memo[x] ||= 0
  memo[x] += 1
end
