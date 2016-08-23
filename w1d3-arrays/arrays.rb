students = ["Timothy B...", "Steven A...", "Lianne C.."]

students.map { |student|
  student.split(' ').map{ |name|
    name.chars[0]
  }.join("")
}

["a", "b", "c"].join("-")

students.each { |s|
  puts "Hello #{s}!"
}

students.keep_if {|s|
  first_initial = s.chars[0]
  first_initial == "S"
}

# sort by last name

students.sort_by {|s|
 s.split(' ').last
}

students = [["Bob", "A"], ["Alice", "C"]]

students[0][0]

# clarify how map works

original_array = [1, 2, 3, 4]
new_array = original_array.map {|x| return x * 2}

# new_array == [2, 4, 6, 8]

original_array = [1, 2, 3, 4]
new_array = []
original_array.each {|x| new_array.push(x * 2)}

