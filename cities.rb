h = [{name: "Canada",
      cities: [{name: "Toronto", pop: 1000 },
               {name: "Ottawa", pop: 10 }]},
     {name: "US",
      cities: [{name: "Miami", pop: 5000 },
               {name: "Seattle", pop: 60 }]}]

# want to calculate total population of all cities

# using map and reduce lets us chain:

total = h.map {|country| country[:cities] }
  .flatten.map {|city| city[:pop]}
  .reduce {|total,pop| total + pop }
puts total

# w/o chaining:

cities = h.map {|country| country[:cities] }.flatten
populations = cities.map{|city| city[:pop]}
total = populations.reduce {|total,pop| total + pop }

# w/o map/reduce

total = 0
h.each do |country|
 country[:cities].each do |city|
   total += city[:pop]
 end
end


























