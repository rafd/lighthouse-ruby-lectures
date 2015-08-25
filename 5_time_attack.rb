time_off_total = 0
number_of_trials = 0
run = true

while run
  time_target = 1 + rand(10)
  puts ""
  puts "Press enter in #{time_target} seconds"
  time_start = Time.now

  input = gets

  time_end = Time.now

  # check if we should end
  if input.chomp == "stop"
    run = false
  end

  # do some calculations
  time_delta = (time_end - time_start).round(2)
  number_of_trials += 1
  time_off = (time_target - time_delta).round(2)
  time_off_total += time_off.abs

  # print results
  puts "You took #{time_delta} seconds"
  if time_off > 0
    puts "You were too fast by #{time_off}s"
  else
    puts "You were too slow by #{-1 * time_off}s"
  end
  average = (time_off_total / number_of_trials).round(2)
  puts "Your average off-by is #{average}s"
end
