students = ["Dr. Hannibal Lecter", "Darth Vader", "Nurse Ratched",
  "Michael Corleone", "Alex DeLarge", "The Wicked Witch of the West",
  "Terminator", "Freddy Krueger", "The Joker", "Joffrey Baratheon",
  "Norman Bates"]
#print out the list of students

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  names.each { |name| puts name }
end

def print_footer(names)
  #we print out the total number of students by using a var
  puts "Overall, we have #{names.count} great students"
end

#we callall defined methods
print_header
print(students)
print_footer(students)
