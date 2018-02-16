def input_students
	puts "\nPlease enter the names of the students"
	puts "\nTo finish, just hit return"
	# create an empty array
	students = []
	# get the first name
	name = gets.chomp
	if name == ""
		puts "There are no students, end of the class!\n\n"
		return
  end
	# while the name is not empty, repeat this code
	while !name.empty? do
	  puts "What cohort are you part of?"
	  month = gets.chomp.upcase
		  if month == ""
				month = "FEBRUARY"
			end
		puts "What is your hobby?"
		hobby = gets.chomp
	  puts "Where do you come from?"
	  country = gets.chomp
	  puts "How tall are you? (in cm)"
	  tall = gets.chomp
		#add the student hash to the array
		students << {name: name, cohort: month, hobbies: hobby, origin: country, height: tall}
		if students.count == 1
			  puts "Now we have 1 student"
		else
		  puts "Now we have #{students.count} students"
		end
		# get another name from the user
		name = gets.chomp
	end
	# return the array of input_students
	students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(students)
  if students == nil
	  puts "There are no students!\n\n"
	  return
  end
	puts "What letter are you looking for?"
	letter = gets.chomp
	i = 0
	while i < students.length do
		if "#{students[i][:name]}".start_with?(letter.upcase) and "#{students[i][:name]}".length < 12
  	  puts "#{(i + 1)}. #{students[i][:name]} loves #{students[i][:hobbies]} and comes from #{students[i][:origin]}. #{students[i][:name]} is #{students[i][:height]}cm tall.".center(150,"-")
		end
		i += 1
  end
end

def print_footer(names)
  if names == nil
	  return
  end
  if names.count == 0
    puts "There are no students!\n\n"
	elsif names.count == 1
	  puts "Overall, we have 1 great student"
  else
    puts "Overall, we have #{names.count} great students"
  end
end

def cohort(students)
  if students == nil
	  return
	end
  cohort = {}
  students.each do |x|
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

#nothing happens until we call the methods
#remove '#' to students = input_students
#remove '#' to print_header
#remove '#' to print(students)
#remove '#' to print_footer(students)
#remove '#' to cohort(students)

def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
			cohort(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu
