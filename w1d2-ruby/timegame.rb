def average(arr)
  s = 0
  arr.each do |n|
    s += n
  end
  s / arr.length
end

offby_history = []

sum = 0
count = 0

while true

  time_target = rand(2..5)

  puts "Hit enter in #{time_target} seconds"
  time_start = Time.now
  gets
  time_end = Time.now

  time_actual = time_end - time_start

  time_offby = (time_target - time_actual)

  if time_offby < 0
    time_offby *= -1
  end

  sum += time_offby
  count += 1
  average = sum / count

  offby_history << time_offby
  # offby_history.push(time_offby)

  puts "You took #{time_actual.round(2)} seconds"
  puts "You were off by #{time_offby.round(2)} seconds"
  puts "Your average: #{average.round(2)}"

  puts "Your average: #{average(offby_history).round(2)}"

end
