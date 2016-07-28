@students = [] #create an empty array

def interactive_menu
  loop do
    print_menu
    process_menu(STDIN.gets.chomp) #get selection from user and pass it to process method
  end
end

def print_menu
  #print out the menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def process_menu(selection)
  case selection
  when "1" then input_students
  when "2" then show_students
  when "3" then ask_for_filename(selection)
  when "4" then ask_for_filename(selection)
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
  ask_for_students
end

def ask_for_students
  loop do
    name = STDIN.gets.chomp #get the name
    break if name == "" #break from loop if no data is entered
    update_students_list(name, "november")
    puts "You have registered #{name} successfully. Now we have #{@students.count} students."
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

def ask_for_filename(io_type)
  puts "Please enter a filename:"
  filename = STDIN.gets.chomp #get filename from user
  io_type == "4" ? load_students(filename) : save_students(filename)
end

def save_students(filename = "students.csv")
  File.open(filename, "w") do |f| #open the file for writing
    @students.each do |student|
      csv_line = [student[:name], student[:cohort]].join(",")
      f.puts csv_line
    end
  end
  puts "Saved #{@students.size} students on #{filename} file."
end

def load_students(filename = "students.csv")
  count = 0
  File.open(filename, "r") do |f| #open the file for reading
    f.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      update_students_list(name, cohort)
      count += 1 #count is used to show the proper number of loaded students
    end
  end
  puts "Loaded #{count} students from #{filename} file."
rescue
  puts "File doesn't exist. Failed to load file."
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  #if no file give at startup call load_students with no argument
  if filename.nil? then load_students
  elsif File.exists?(filename) then load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit #quit the program
  end
end

try_load_students
interactive_menu
