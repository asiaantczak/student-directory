require 'csv'

@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to the file"
  puts "4. Load the list from the file"
  puts "9. Exit"
end

def interactive_menu
  try_load_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      puts "You chose to add student"
      input_students
    when "2"
      puts "You chose to display student list"
      show_students
    when "3"
      puts "You chose to save the students to the file- enter the name of the file or default will be used"
      filename = STDIN.gets.chomp
      save_students(filename)
    when "4"
      puts "You chose to load student list from the file"
      filename = STDIN.gets.chomp
      load_students(filename)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just enter return twice"
  name = STDIN.gets.chomp
  
  while !name.empty? do
    add_student(name)
    puts "Now we have #{@students.count} student"
    name = STDIN.gets.chomp
  end
end

def add_student(name, cohort = "november")
  @students << {name: name, cohort: cohort.to_sym}
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------------------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students(filename)
  if filename == ""
    filename = "students.csv"
  end
  CSV.open("#{filename}", "w") do |csv| 
    @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv << student_data
    end
  end
end

def load_students(filename)
  if !File.exists?(filename)
    filename = "students.csv"
  end
  CSV.foreach("#{filename}", "r") do |row|
    name, cohort = row
    add_student(name, cohort.to_sym)
  end
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    filename = "students.csv"
  end
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
end

interactive_menu