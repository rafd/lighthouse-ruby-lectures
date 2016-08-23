words = "Bacon ipsum dolor amet ball tip frankfurter ham shoulder pork chop landjaeger. Beef ribs jerky ham hock prosciutto ball tip. Bresaola ham hock boudin, filet mignon short ribs kielbasa kevin leberkas. Drumstick bresaola doner venison jowl, sausage tail strip steak corned beef salami turducken. Swine rump corned beef pastrami. Shoulder ham hock strip steak bacon meatloaf chuck ball tip biltong swine pork loin tenderloin"

# given the string, calculate how many times words beginning with each letter occur
# sample result {"a" => 5, "b" => 3, ...}

counts = {}
words.split(" ").each do |word|
  first_letter = word.downcase[0]

  unless counts[first_letter]
    # when this is the first time we see the letter
    # initialize at 1
    counts[first_letter] = 1
  else
    counts[first_letter] += 1
  end
end

# sort by key
puts counts.sort.inspect

# sort by value
ordered = counts.sort_by do |k,v|
  v
end

puts ordered.reverse.inspect


