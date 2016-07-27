def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  loop do
    puts "Please enter a name:"
    name = gets #gets name
    name.chop! if name.end_with?("\r", "\n")
    break if name == "" #break from loop if no data entered
    #if no name is entered, Anonymus is used
    name = "Anonymous" if name.gsub(/\s/, "").empty?
    puts "Please enter a cohort for #{name}:"
    cohort = gets.downcase #get cohort
    cohort.chop! if cohort.end_with?("\r", "\n")
    #if no cohort is entered, november cohort is used
    cohort = "november" if cohort.gsub(/\s/, "").empty?
    #add the student hash to the array
    students << {name: name, cohort: cohort.to_sym}
    student_w = students.count == 1 ? "student" : "students"
    puts "Now we have #{students.count} #{student_w}."
  end
  students #return the students array
end

def print_header
  $line_width = 100
  puts "The students of Villains Academy".center($line_width)
  puts "-------------".center($line_width)
end

def print(students)
  students_in_groups = {} #new hash to store names groupped by cohort
  students.each do |student|
    cohort = student[:cohort]; name = student[:name]
    students_in_groups.include?(cohort) ? students_in_groups[cohort] << name :
    students_in_groups[cohort] = [name]
  end
  #print out all the student related data (index /starts at 1/, name, cohort)
  #groupped in cohort
  students_in_groups.each do |cohort, names|
    puts "In #{cohort.capitalize} cohort:".ljust($line_width * 0.4) + names.join(", ")
  end
end

def print_footer(students)
  student_w = students.size == 1 ? "student" : "students"
  #we print out the total number of students by using a var
  puts
  puts "Overall, we have #{students.size} great #{student_w}.".center($line_width)
end

#we call all the defined methods
students = input_students
if students.size > 0
  print_header
  print(students)
  print_footer(students)
end
