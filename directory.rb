def interactive_menu
  students = []
  loop do
  # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
  # 2. read the input and save it into variable
    selection = gets.chomp
  # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just enter return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  cohort = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    if cohort == "" || cohort == " "
      students << {name: name, cohort: "April"}
    else
       students << {name: name, cohort: cohort.to_sym}
    end
    
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
       puts "Now we have #{students.count} students"
    end
    # get another name from the user
    name = gets.chomp
    cohort = gets.chomp 
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------------------------"
end

def print(students)
  i = 0
  while i < students.length do
    puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)".center(60)
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

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

interactive_menu
