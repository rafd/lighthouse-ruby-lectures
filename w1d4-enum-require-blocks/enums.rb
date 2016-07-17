# enumerables

a = [1,2,3,4,5,6,7,8]


puts "select"
p a.select {|x| x > 5 }

puts "detect"
p a.detect {|x| x > 5 }

puts "count"
p a.count

puts "count w/ block"
p a.count {|x| x > 5}

puts "map"
p a.map {|x| x*x }

puts "map then count"
p a.map {|x| x*x }.count {|x| x > 10 }

puts "each" # use it for side-effects
p a.each {|x| puts x }



# reduce  (aka inject) (aka fold)

a = [1,2,3,4,5,6,7,8]
puts "reduce (implementing sum)"
p a.reduce {|memo,x| memo + x}

b = [1,6,1,8,9,3,5,8,3]
puts "reduce (implement max)"
p b.reduce { |memo,x| memo > x ? memo : x }


























