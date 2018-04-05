@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just enter return twice"
  name = gets.chomp
  
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} student"
    name = gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
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

interactive_menu

# additional/ improved methods from excercises step8
=begin
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just enter return twice"
  name = gets.chomp
  cohort = gets.chomp  
  
  while !name.empty? do
    if cohort == "" || cohort == " "
      @students << {name: name, cohort: "April"}
    else
       @students << {name: name, cohort: cohort.to_sym}
    end
    
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
       puts "Now we have #{@students.count} students"
    end
    name = gets.chomp
    cohort = gets.chomp 
  end
end

def print_students_list
  i = 0
  while i < @students.length do
    puts "#{i + 1}. #{@students[i][:name]} (#{@students[i][:cohort]} cohort)".center(60)
    i += 1
  end
end

def print_by_cohorts(students)
  cohorts = {}
  
  students.each do |student|
    cohort = student[:cohort]
    name = student[:name]
    
    if cohorts[cohort] == nil
      cohorts[cohort] = [name]
    else
      cohorts[cohort] << name
    end
  end
   
  cohorts.each do |cohort, name|
    puts "\n#{cohort.capitalize} cohort students: " 
    puts "--------------------------------------"
    puts name
  end
end

def print_by_letter(students)
  puts "See the list of students whose name begins with a"
  letter = gets.chomp
  students.each_with_index do |student, index|
    if "#{student[:name][0]}" == letter
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_by_length(students)
  puts "Below is a list of students whose name is shorter than 12 characters"
  students.each_with_index do |student, index|
    if student[:name].length < 12 
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end
=end