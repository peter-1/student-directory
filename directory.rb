=begin
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
=end

students = [{name: "Dr. Hannibal Lecter", cohort: :november, country_of_birth: "USA",
  height: "170 cm", hobby: ["singing", "dancing", "driving a car"]},
  {name: "Darth Vader", cohort: :november, country_of_birth: "China",
  height: "181 cm", hobby: ["sleeping", "fighting", "travelling"]},
  {name: "Nurse Ratched", cohort: :november, country_of_birth: "USA",
  height: "181 cm", hobby: ["travelling", "reading"]},
  {name: "Michael Corleone", cohort: :november, country_of_birth: "Italy",
  height: "181 cm", hobby: ["going out with the family", "supporting the society", "eating"]},
  {name: "Alex DeLarge", cohort: :november, country_of_birth: "Holland",
  height: "181 cm", hobby: ["reading", "writing", "dancing"]},
  {name: "The Wicked Witch of the West", cohort: :november, country_of_birth: "UK",
  height: "181 cm", hobby: ["sleeping"]},
  {name: "Terminator", cohort: :november, country_of_birth: "Austria",
  height: "181 cm", hobby: ["driving a car", "going to the gym", "dancing", "shooting"]},
  {name: "Freddy Krueger", cohort: :november, country_of_birth: "Germany",
  height: "181 cm", hobby: ["running", "eating", "cooking", "knitting"]},
  {name: "The Joker", cohort: :december, country_of_birth: "Mexico",
  height: "181 cm", hobby: ["joking", "playing with batman", "laughing"]},
  {name: "Joffrey Baratheon", cohort: :december, country_of_birth: "Canada",
  height: "181 cm", hobby: ["coding", "sleeping"]},
  {name: "Norman Bates", cohort: :december, country_of_birth: "USA",
  height: "181 cm", hobby: ["cooking", "dancing", "taking care of the family"]}]


def print_header
  $line_width = 100
  puts "The students of Villains Academy".center($line_width)
  puts "-------------".center($line_width)
end

def print(students)
  #print out all the student related data (index /starts at 1/, name, cohort)
  students.each_with_index do |student, i|
    puts "#{i + 1}. #{student[:name]}".ljust($line_width * 0.4) +
    "Cohort: #{student[:cohort].capitalize}"
    puts "".ljust($line_width * 0.4) +
    "Country of birth: #{student[:country_of_birth]}, Height: #{student[:height]}"
    puts "".ljust($line_width * 0.4) + "Hobbies: #{student[:hobby].join(", ")}"
  end
end

def print_footer(students)
  #we print out the total number of students by using a var
  puts
  puts "Overall, we have #{students.size} great students.".center($line_width)
end

#we call all the defined methods
#students = input_students
print_header
print(students)
print_footer(students)
