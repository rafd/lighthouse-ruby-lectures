def greet
  puts "What's your name?"
  name = gets.chomp
  puts "Hi '"+name+"'"
  return name
end

def goodbye(x)
  puts "Bye "+x
end

n = greet
goodbye(n)
