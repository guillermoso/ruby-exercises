# Ruby Dojo
# Docs:
# https://ruby-doc.org/core-3.0.1/
#

# Working with Strings in Ruby
# Highlights:
 # - You can join multiple strings using interpolation or concatenation
 # - You use other basic operator other than "+" with strings
  
# How to run this file
# 1. Open a terminal and `cd` to where the project is
  # cd path/to/ruby-exercises/Module1/data-types
# 2. Run the file
  # ruby strings_exercise.rb

# You can use the method "puts" to output the result to the console
# puts a_variable
# puts "Hello World!"

# Exercise 1:
puts "Use a method to transform the string so that every letter on the string is uppercase"
alice = "alice"
puts alice.upcase
#=> ALICE

# Exercise 2:
puts "Use a method to transform the string so that only the first letter is uppercase"
alice = "aLiCe"
puts alice.downcase.capitalize
#=> Alice

# Exercise 3:
puts "Use a method to transform the string so that it reads backwards"
phrase = "The most inflated egos are often the most fragile."
puts phrase.reverse
#=> ".eligarf tsom eht netfo era soge detalfni tsom ehT"

# Exercise 4:
puts "Use a method to transform the string so that every 'o' turns to 'u'"
phrase = "The most inflated egos are often the most fragile."
puts phrase.tr('o', 'u')
#=> "The must inflated egus are uften the must fragile."

# Exercise 5:
puts "Use a method to remove the duplicated ! sign "
phrase = "Hello World!!"
puts phrase.squeeze("!")
#=> "Hello World!"

# Exercise 6:
puts "Use a method to remove the vocals from the string"
phrase = "The most inflated egos are often the most fragile."
puts phrase.tr("aeiou", "")
#=> "Th mst nfltd gs r ftn th mst frgl."

# Exercise 7:
puts "Use a method to count all the characters from the string"
phrase = "The most inflated egos are often the most fragile."
puts phrase.size
#=> 50

# Exercise 8:
puts "Use a method to invert the string case"
phrase = "The most Inflated egOs are ofTen The mOsT Fragile."
puts phrase.swapcase
#=> "tHE MOST iNFLATED EGoS ARE OFtEN tHE MoSt fRAGILE."

# Exercise 9:
puts "Use a method check if the word 'fragile' exists on the phrase"
phrase = "The most inflated egos are often the most fragile."
puts phrase.include? "fragile"
#=> true

# Exercise 10:
puts "Concatenate the two provided strings"
greetings = "Hello, my name is:"
name = "Alice"
puts greetings + " " + name + "!"
#=> "Hello, my name is: Alice!"

# Exercise 11:
puts "Interpolate the two provided strings"
greetings = "Hello, my name is:"
name = "Alice"
puts "#{greetings} #{name}!"
#=> "Hello, my name is: Alice!"

# Exercise 12:
puts "Repeat the full message 200 times. Mind the spaces"
greetings = "Hello, my name is:"
name = "Alice"
puts "#{greetings} #{name}! " * 200
#=> "Hello, my name is: Alice! Hello, my name is: Alice! Hello, my name is: Alice!..."




