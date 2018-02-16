
@students = [] # an empty array accessible to all methods

def input_students
	puts "\nPlease enter the names of the students"
	puts "\nTo finish, just hit return"
	# get the first name
	name = gets.chomp
	if name == ""
		puts "There are no new students, end of the class!\n\n"
		return
  end
	# while the name is not empty, repeat this code
	while !name.empty? do
	  puts "What cohort are you part of?"
	  month = gets.chomp.upcase
		  if month == ""
				month = "FEBRUARY"
			end
		@students << {name: name, cohort: month}
		if @students.count == 1
			  puts "Now we have 1 student"
		else
		  puts "Now we have #{@students.count} students"
		end
		# get another name from the user
		name = gets.chomp
	end
end

def print_header
  puts "The students of Makers Academy"
  puts "-------------"
end

def print_students_list
  if @students == nil
	  puts "There are no students!\n\n"
	  return
  end
	puts "What letter are you looking for?"
	letter = gets.chomp
	i = 0
	while i < @students.length do
		if "#{@students[i][:name]}".start_with?(letter.upcase) and "#{@students[i][:name]}".length < 12
  	  puts "#{(i + 1)}. #{@students[i][:name]}".center(150,"-")
		end
		i += 1
  end
end

def print_footer
  if @students.count == 0
    puts "There are no students!\n\n"
	elsif @students.count == 1
	  puts "Overall, we have 1 great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

def cohort
  if @students == nil
	  return
	end
  cohort = {}
  @students.each do |x|
    cohorts = x[:cohort]
    person = x[:name]
    if cohort[cohorts] == nil
      cohort[cohorts] = [person]
    else
      cohort[cohorts].push(person)
    end
  end
  puts cohort.to_a
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end
def show_students
  print_header
  print_students_list
  print_footer
	cohort
end
def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(", ")
    file.puts csv_line
  end
  file.close
end
def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end
def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
		when "3"
      save_students
		when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end
def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu
