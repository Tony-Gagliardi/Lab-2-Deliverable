# Lab2.rb
# Anthony Gagliardi - <anthony.gagliardi@colorado.edu>
# Last Modified - 11 September 2013
# An introductory program in Ruby.

# Part 1: Hello world 
class HelloWorldClass
	def initialize(name)
		@name = name.capitalize
	end
	def sayHi
		puts "Hello #{@name}!"
	end
end
hello = HelloWorldClass.new("Anthony")
hello.sayHi

# Part 2: Strings
def palindrome?(string)
	string = (string.gsub(/[^A-Za-z]/, "").downcase)
	return string == string.reverse
end

# palindrome test cases, uncomment to verify functionality
puts palindrome?("A man, a plan, a canal -- Panama")
puts palindrome?("Madam, I'm Adam!")				   	
puts palindrome?("Abracadabra")					

def count_words(string)
	string = (string.gsub(/[^A-Za-z|\s]/, "").downcase)
	# Assigning a new variable to the seperated elements of string
	words = string.split
	# Assigning a new variable to be a new hash
	wordsNew = Hash.new(0)
    
    # Iterating over the string and counting duplicate entries
	words.each do |word|
		wordsNew[word] += 1
	end
	# Iterating over the new hash and establishing a count for
	# every key
	wordsNew.each do |keys, word|
	end
end

#word count test cases, uncomment to verify functionality
puts count_words("A man, a plan, a canal -- Panama")
puts count_words("Doo bee doo bee doo")


