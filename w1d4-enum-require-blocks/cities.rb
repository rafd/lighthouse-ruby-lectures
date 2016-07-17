h = [{name: "Canada",
      cities: [{name: "Toronto", pop: 1000 },
               {name: "Ottawa", pop: 10 }]},
     {name: "US",
      cities: [{name: "Miami", pop: 5000 },
               {name: "Seattle", pop: 60 }]},
     {name: "China",
      cities: [{name: "Beijing", pop: 8000 },
               {name: "Shanghai", pop: 6000 }]}]

# TASK 1: CALCULATE TOTAL POPULATION OF ALL CITIES

# using map and reduce lets us chain:

total = h.map { |country| country[:cities] }
         .flatten
         .map { |city| city[:pop] }
         .reduce { |total, pop| total + pop }

p total

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


# TASK 2: return names of cities of countries with total population > 4000

cities = h
  .map do |country|
    country[:total_population] = country[:cities].map {|city| city[:pop] }.reduce(:+)
    country
  end
  .select { |country| country[:total_population] > 4000 }
  .map {|country| country[:cities].map {|city| city[:name]}}
  .flatten

p cities


