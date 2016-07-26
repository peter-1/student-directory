students = ["Dr. Hannibal Lecter", "Darth Vader", "Nurse Ratched",
  "Michael Corleone", "Alex DeLarge", "The Wicked Witch of the West",
  "Terminator", "Freddy Krueger", "The Joker", "Joffrey Baratheon",
  "Norman Bates"]
#print out the list of students
puts "The students of Villains Academy"
puts "-------------"
students.each { |student| puts student }
#we print out the total number of students by using a var
puts "Overall, we have #{students.count} great students"
