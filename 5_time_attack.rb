def average(arr)
  sum = 0
  arr.each do |a|
    sum += a
  end
  return sum / arr.length
end

sum = 0
count = 0
errors = []

while true
  target_time = rand(2..6)

  puts "Hit enter in #{target_time}s"
  t_0 = Time.now
  gets
  t_1 = Time.now

  delta = t_1 - t_0
  puts "You took #{delta.round(2)}s"

  error = (target_time - delta).abs
  puts "You were off by #{error.round(2)}s"

  sum += error
  count += 1

  errors << error

  # puts errors.inspect

  puts "Average Error: #{(sum/count).round(2)}s"
  puts "Average Error: #{average(errors).round(2)}s"

  puts ""
end
