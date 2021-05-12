# Ruby Dojo
# Docs:
# https://ruby-doc.org/core-3.0.1/
#

# Working with Arrays in Ruby
# Highlights:
 # - You can join multiple arrays using +
 # - You can modify the content of an array with multiple other methods
 # - You can remove elements from an array
  
# How to run this file
# 1. Open a terminal and `cd` to where the project is
  # cd path/to/ruby-exercises/Module1/arrays
# 2. Run the file
  # ruby exercise.rb

# You can use the method "puts" to output the result to the console
# puts a_variable
# puts ["Luke", "Yoda"]

# Exercise 1:
puts "Use a method to get the size of an array"
heroes = ["Thor", "Hulk", "Iron Man"]
puts heroes.size
#=> 3

# Exercise 2:
puts "Append 2 more heroes to the array"
heroes = ["Thor", "Hulk", "Iron Man"]
#=> ["Thor", "Hulk", "Iron Man", "Black Widow", "Wanda"]
heroes << "Black Widow"
heroes << "Wanda"
puts heroes

# Exercise 3:
puts "Remove the villains from the heroes array"
heroes = ["Thor", "Hulk", "Dark Elf", "Iron Man", "Loki", "Thanos"]
#=> ["Thor", "Hulk", "Iron Man"]
villains = ["Dark Elf", "Loki", "Thanos"]
puts heroes - villains

# Exercise 4:
puts "Create a nested array with all of your family members, include:"
# name: string
# age: integer
family = [["Eduardo", 64], ["Hortensia", 58], ["Alex", 30], ["Jessica", 26], ["Guillermo", 24]]
puts family

# Exercise 5:
puts "Insert a villain after a heroe"
heroes = ["Thor", "Hulk", "Iron Man"]
villains = ["Thanos", "Loki", "Dark Elf"]
heroes.insert(1, "Thanos")
heroes.insert(3, "Loki")
heroes.insert(-1, "Dark Elf")
#=> ["Thor", "Thanos", Hulk", "Loki", "Iron Man", "Dark Elf"]
puts heroes

# Exercise 6:
puts "Use a method to get a simple array from a nested one"
heroes = [["Thor", "Black Widow"], "Hulk", ["Iron Man", "War Machine"], ["Wanda"]]
puts heroes.flatten
#=> ["Thor", "Black Widow", "Hulk", "Iron Man", "War Machine", "Wanda"]

# Exercise 7:
puts "Use a method to remove all the duplicated heroes"
heroes = ["Thor", "Hulk", "Iron Man", "Thor", "Hulk", "Spider Man", "Wanda", "Wanda"]
puts heroes.uniq
#=> ["Thor", "Black Widow", "Hulk", "Iron Man", "War Machine", "Wanda"]

# Exercise 8:
puts "Use a method to inverse the heroes array"
heroes = ["Thor", "Hulk", "Iron Man"]
puts heroes.reverse
#=> ["Iron Man", "Hulk", "Thor"]

# Exercise 9:
puts "Use a method to get a string separated by commas from the heroes array"
heroes = ["Thor", "Hulk", "Iron Man"]
puts heroes.join(", ")
#=> "Iron Man, Hulk, Thor"

# Exercise 10:
puts "What would be the output from the following invokations."
heroes = ["Thor", "Hulk", "Iron Man"]
heroes[3] # nil

heroes * 3 # ["Thor", "Hulk", "Iron Man", "Thor", "Hulk", "Iron Man", "Thor", "Hulk", "Iron Man"]

heroes[-1] # Iron Man

heroes.pop # Iron Man  -- heroes => ["Thor", "Hulk"]

numbers = [1,2,3]

numbers.max # 3

numbers.min # 1

numbers.sum # 6
