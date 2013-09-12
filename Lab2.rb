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
	# filters out everything except for letters
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

# Part 3: Rock Paper Scissors
class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError; end

# game functionality
def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	# 3 possible strategies
	strats = ["S", "P", "R"]
	# if it is a valid strategy
	if strats.include?(game[0][1].upcase) && strats.include?(game[1][1].upcase)
		# if there is a tie or if it's a case where player 1 should win
		if  game[0][1] + game[1][1] =~ /SS|PP|RR|SP|PR|RS/i
				game[0]
		# if player 2 should win, only 3 cases handled by else
		else
				game[1]
		end
	# if it is not a valid strategy, raise a strategy error
	else
		raise NoSuchStrategyError
	end
end

# Game functionality test cases
game1 = [ ["Armando", "P"], ["Dave", "S"] ]
p rps_game_winner(game1)

# tournament functionality
def rps_tournament_winner(bracket)
	# if there are games left to play
	if bracket[0][1].class == String
		rps_game_winner(bracket)
	# recurse over the bracket until there are only two
	# players left
	else
		# player 1
		m1 = rps_tournament_winner(bracket[0])
		#player 2
		m2 = rps_tournament_winner(bracket[1])
		# recurse with these two players playing eachother
		rps_tournament_winner([m1, m2])
	end
end

# test cases for tournament functionality
tournament = [[[ ["Chris", "P"], ["Alec", "S"] ],[ ["Tony", "R"],  ["Jenaer", "S"] ],],[[ ["Kelsey", "S"], ["Mitch", "P"] ],[ ["Ryan", "R"], ["Dinkel", "P"]]]]
p rps_tournament_winner(tournament)

#Part 4: Anagrams
def combine_anagrams(words)
	#Assigning a new variable to be a new hash
	anagram = Hash.new(0)
	# Iterates through the string and operates on each word
	words.each do |word|
		# Split the word
		step1 = word.split("")
		# Sort that word
		step2 = step1.sort
		# See if it matches any others in the list
		lettercheck = step2.join("")
		# If it finds a match, store them together in new array
		if anagram.include?(lettercheck)
			anagram[lettercheck].insert(0, word)
		# if not, leave it alone
		else
			anagram[lettercheck] = [word]
		end
	end
	newOutput = []
	anagram.each do |key, value|
		newOutput.push(value)
	end
	p newOutput
end

# Test cases for anagrams, uncomment to verify functionality
input = ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams, scream']
combine_anagrams(input)
