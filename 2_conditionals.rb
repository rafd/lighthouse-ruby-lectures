n = gets.chomp.to_i

if n >= 5
  puts "greater than 5"
elsif n < 5 and n > 0
  puts "between 0 and 5"
else
  puts "something else"
end
