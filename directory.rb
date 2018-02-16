def input_students
	puts "\nPlease enter the names of the students"
	puts "\nTo finish, just hit return twice"
	# create an empty array
	students = []
	# get the first name
	name = gets
	# while the name is not empty, repeat this code
	while !name.empty? do
	  puts "What cohort are you part of?".gsub(/[W]/, "\nW")
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
			if name == "\n"
				puts "There are no students, end of the class!"
				exit
			else
			  puts "Now we have 1 student"
			end
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
	 if names.count == 1
		 puts "Overall, we have 1 great student"
	 else
     puts "Overall, we have #{names.count} great students"
	 end
end

students = input_students

def cohort(students)
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
print_header
print(students)
print_footer(students)
cohort(students)
