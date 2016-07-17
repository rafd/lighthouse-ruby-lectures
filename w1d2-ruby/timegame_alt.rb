RUNS = 10
time_total = 0

RUNS.times do |index|
  run_counter = index + 1
  time_target = rand(2..6)

  puts "Hit enter in #{time_target} seconds"

  time_before = Time.now
  gets
  time_after = Time.now

  time_taken = time_after - time_before

  time_total += time_taken


  puts "You took #{time_taken.round(2)}s"

  if time_taken > time_target
    puts "You were over by #{(time_taken - time_target).round(2)}s"
  else
    puts "You were under by #{(time_target - time_taken).round(2)}s"
  end
  puts "So far, on average you were off by #{(time_total / run_counter).round(2) }s"
  puts "\n-------\n\n"
end

puts "On average you were off by #{(time_total / RUNS).round(2)}s"
