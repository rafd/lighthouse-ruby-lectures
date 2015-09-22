def average(array)
  sum = 0
  array.each do |x|
    sum += x
  end
  return sum / array.length
end

times_off_by = []

while true
  time_target = rand(3..7)
  puts ""
  puts "hit enter in #{time_target} seconds"

  time_start = Time.now
  gets
  time_end = Time.now
  time_difference = time_end - time_start
  puts "you took #{time_difference} seconds"

  time_off_by = (time_target - time_difference).abs
  times_off_by << time_off_by
  puts "you were off by #{time_off_by} seconds"

  puts "your average is #{average(times_off_by)} seconds"
end
