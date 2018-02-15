def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	# create an empty array
	students = []
	# get the first name
	name = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
	  puts "What is your hobby"
	  hobby = gets.chomp
	  puts "Where do you come from?"
	  country = gets.chomp
	  puts "How tall are you?"
	  tall = gets.chomp
		#add the student hash to the array
		students << {name: name, cohort: :november, hobbies: hobby, origin: country, height: tall}
		puts "Now we have #{students.count} students"
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
  	  puts "#{(i + 1)}. #{students[i][:name]} (#{students[i][:cohort]} cohort) who loves #{students[i][:hobbies]} and comes from #{students[i][:origin]}. #{students[i][:name]} is #{students[i][:height]}cm tall.".center(150,"-")
		end
		i += 1
  end
end
 def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
