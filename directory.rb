@students = [] #create an empty array

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp) #get selection from user and pass it to process method
  end
end

def print_menu
  #print out the menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1" then input_students
  when "2" then show_students
  when "3" then save_students
  when "4" then load_students
  when "9" then exit #exists the program
  else
    puts "I don't know what you meant, please try again."
  end
end

def show_students
  print_header; print_students_list; print_footer
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp #get the first name
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    update_students_list(name, "november")
    puts "Now we have #{@students.count} students"
    #get another name from the user
    name = STDIN.gets.chomp
  end
end

def update_students_list(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  file = File.open("students.csv", "w") #open the file for writing
  @students.each do |student|
    csv_line = [student[:name], student[:cohort]].join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    update_students_list(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.size} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit #quit the program
  end
end

try_load_students
interactive_menu
