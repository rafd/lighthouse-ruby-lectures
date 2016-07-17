def average(arr)
  sum = 0
  arr.each do |a|
    sum += a
  end
  return sum / arr.length
end

TIMES_TO_RUN = 5

def run
  sum = 0
  count = 0
  errors = []

  TIMES_TO_RUN.times do
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

    puts "Average Error: #{(sum/count).round(2)}s"
    puts "Average Error: #{average(errors).round(2)}s"

    puts ""
  end
end

run
