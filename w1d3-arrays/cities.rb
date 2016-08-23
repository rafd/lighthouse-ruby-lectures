countries =
  {"Canada" => {:cities => ["Toronto","Vancouver"],
                :population => 1234,
                :capital => "Ottawa" },
   "United States" => {:cities => ["New York","Washington"],
                       :population => 4567,
                       :capital => "Washington DC" }}

# [1234, 4567]
puts countries.map do |k,v|
  return v # [:population]
end

# ["Toronto", "New York"]
puts countries.map do |k,v|
  return v[:cities][0]
end

# Vancouver
puts countries["Canada"][:cities][1]

# ["Canada", "United States"]
puts countries.map do |k,v|
   return k
end
