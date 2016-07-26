def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name of student
    name = gets.chomp
  end
  #return the students array
  students
end

def print_header
  puts "The students of Villains Academy whose name starts with 'H'"
  puts "-------------"
end

def print(students)
  $count = 0
  #print out all the data (index /starts at 1/, name, cohort) for
  #those students whose name starts with "H"
  students.each_with_index do |student, i|
    if student[:name].lstrip.upcase[0] == "H"
      puts "#{i + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
      $count += 1
    end
  end
end

def print_footer(names)
  #we print out the total number of students by using a var
  puts "Overall, we have #{names.count} great students."
  puts "We have #{$count} students whose name starts with 'H'."
end

#we callall defined methods
students = input_students
print_header
print(students)
print_footer(students)
