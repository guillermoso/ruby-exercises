# Ruby Dojo
# Docs:
# https://ruby-doc.org/core-3.0.1/
#

# Working with conditionals and loops in Ruby
# Highlights:
 # - There are two boolean operators - || and &&
 # - The evaluation of a condition is a boolean
 # - Watch for infinite loops for a condition
  
# How to run this file
# 1. Open a terminal and `cd` to where the project is
  # cd path/to/ruby-exercises/Module1/flow-control
# 2. Run the file
  # ruby exercise.rb

# You can use the method "puts" to output the result to the console
# puts a_variable
# puts "Alice"

# Exercise 1:
# Given an array of integers print when is odd and when is even
# Hint: You need to use one of the loops from the lesson
integers = (1..100).to_a

i = 0
while i < integers.length do
  number = integers[i]
  message = "#{number} is "
  if number.even?
    message << "even"
  else
    message << "odd"
  end
  puts message
  i += 1
end

# Exercise 2:
# You get to throw a dice, print the following for each value:
# 1 - You only live once
# 2 - You have two hands
# 3 - March is the third month of the year
# 4 - Fantastic Four
# 5 - 5 seconds to...
# 6 - Number of first Avengers
dice = [1,2,3,4,5,6]
dice_result = dice.sample

if dice_result == 1
  puts "You only live once"  
elsif dice_result == 2
  puts "You have two hands"
elsif dice_result == 3
  puts "March is the third month of the year"
elsif dice_result == 4
  puts "Fantastic Four"
elsif dice_result == 5
  puts "5 seconds to..."
elsif dice_result == 6
  puts "Number of first Avengers"
end


# Exercise 3:
# Given the following code:
# 1. What is the output from the first condition => "There is plenty of cars for everyone"
# 2. What is the output from the second condition => "Four wheels are safer"
# 3. What is the output from the third condition => "Maybe we split?"
# 4. Change the values for people, cars and motorcycles:
#    4.1 people = 20, cars = 10, motorcycles = 30
people = 30
cars = 40
motorcycles = 15

if cars > people
  puts "There is plenty of cars for everyone"
elsif cars < people
  puts "We don't have enough cars"
else
  puts "Well this is odd!"
end

if motorcycles > cars
  puts "We love the two wheels vehicles"
elsif motorcycles < cars
  puts "Four wheels are safer"
else
  puts "Is there any other out?"
end

if people > motorcycles
  puts "Maybe we split?"
else
  puts "Everyone gets a bike"
end

# 4. Change the values for people, cars and motorcycles:
#    4.1 people = 20, cars = 10, motorcycles = 30
# 1. What is the output from the first condition => "We don't have enough cars"
# 2. What is the output from the second condition => "We love the two wheels vehicles"
# 3. What is the output from the third condition => "Everyone gets a bike"
people = 20
cars = 10
motorcycles = 30

if cars > people
  puts "There is plenty of cars for everyone"
elsif cars < people
  puts "We don't have enough cars"
else
  puts "Well this is odd!"
end

if motorcycles > cars
  puts "We love the two wheels vehicles"
elsif motorcycles < cars
  puts "Four wheels are safer"
else
  puts "Is there any other out?"
end

if people > motorcycles
  puts "Maybe we split?"
else
  puts "Everyone gets a bike"
end

# Exercise 4: 
# Given an string:
# 1. print the words that have 2 letters, following this format - The word 'On' has two words 
# 2. print the words that have more than to 2 letters and less or equal to 5 letters, following this format - The word 'man' has thre words
# 3. print the words that have more than 5 letters, following this format - The word 'offering' has more than 5 words 
phrase = "On offering to help the blind man, the man who then stole his car, had not, at that precise moment, had any evil intention, quite the contrary, what he did was nothing more than obey those feelings of generosity and altruism which, as everyone knows, are the two best traits of human nature and to be found in much more hardened criminals than this one, a simple car-thief without any hope of advancing in his profession, exploited by the real owners of this enterprise, for it is they who take advantage of the needs of the poor"
split_phrase = phrase.split

i = 0
while i < split_phrase.length do
  word = split_phrase[i]

  if word.length == 2
    puts "The word #{word} has two letters"
  elsif word.length > 2 && word.length <= 5
    puts "The word #{word} has three letters"
  elsif word.length > 5
    puts "The word #{word} has more than 5 letters" 
  end

  i += 1
end



# Exercise 5:
# Using a `times` iterator print the even numbers from a given number
number = 100

number.times do |i|
  if i.even?
    puts i
  end
end

# Exercise 6:
# Using a `times`, `while` and `until` loops print "Beetlejuice!" three times
3.times do
  puts "Beetlejuice!"
end

i = 0
while i < 3
  puts "Beetlejuice!"
  i += 1
end

i = 0
until i == 3
  puts "Beetlejuice!"
  i += 1
end