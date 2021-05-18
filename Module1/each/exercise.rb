# Ruby Dojo
# Docs:
# https://ruby-doc.org/core-3.0.1/
#

# Introduction to each
# Highlights:
 # - #each works for hash and arrays
 # - Is it called an iterator and repeats as many elements as it contains
  
# How to run this file
# 1. Open a terminal and `cd` to where the project is
  # cd path/to/ruby-exercises/Module1/each
# 2. Run the file
  # ruby exercise.rb

# You can use the method "puts" to output the result to the console
# puts a_variable
# puts "Alice"

# Exercise 1:
# Given an array of anime characters:
# 1. Print each name capitalized
# 2. Print each name reversed
# 3. Print each name uppercased
characters = ["goku", "deku", "eren", "vegeta", "saitama", "mikasa", "katara"]

characters.each do |character|
  puts character.capitalize
  puts character.reverse
  puts character.upcase
end
puts ""

# Exercise 2:
# Given an array of anime characters:
# 1. Create a new array with the names with less or equal than 4 letters
# 2. Create a new array with only the lenghts of the names
characters = ["goku", "deku", "eren", "vegeta", "saitama", "mikasa", "katara"]

small_character_names = []
character_name_lenghts = []

characters.each do |character|
  name_length = character.length

  character_name_lenghts << name_length
  small_character_names << character if name_length <= 4
  
end
puts ""

# Exercise 3:
# Given an array of numbers:
# 1. Substract the numbers from the array and get the total
# 2. Print only the numbers divisible by 3
# 3. Print the square number for each number
numbers = [67, 78, 68, 24, 15, 41, 58, 81, 33, 13]

substraction_result = 0

numbers.each do |number|
  substraction_result -= number

  puts "#{number} is divisible by 3" if number % 3 == 0

  puts "Square of #{number} is equal to #{number ** 2}"
end

puts "Substraction result: #{substraction_result}"
puts ""

# Exercise 4:
# Given an array of numbers:
# 1. Create a new array with only even numbers
# 2. Create a new array with only odd numbers
# 3. Create a new array with only prime numbers
numbers = [30, 8, 31, 40, 33, 69, 84, 9, 61, 97]

even_numbers = []
odd_numbers = []
prime_numbers = []

numbers.each do |number|
  even_numbers << number if number.even?
  odd_numbers << number if number.odd?
  
  # search for prime numbers
  prime = true
  number.times do |x|
    x += 1
    next if x == 1 || x == number

    prime = false if number % x == 0 
  end

  prime_numbers << number if prime
end

puts "Even numbers #{even_numbers.inspect}"
puts "Odd numbers #{odd_numbers.inspect}"
puts "Prime numbers #{prime_numbers.inspect}"
puts ""

# Exercise 5:
# Given the following array:
# [["Goku", "37"] ["Deku", "16"], ["Eren", "19"], ["Vegeta", "48"], ["Saitama", "25"], ["Mikasa", "19"], ["Katara", "16"]]
# 1. Create an array of hashes with two keys, name and age. For example [{name: "Goku", age: 37}]
# 2. Store the age in the hash as an integer
# 4. Add an abilities element(array) to the original array, and add it to the hash. For example [["Goku", 37, ["Kaioken", "Kamekameha"]]]
# 6. Print the character profile matching the following format:
#  Goku is a 37 years old with and is able to Kaioken, Kamekameha
# puts characters.inspect

characters = [["Goku", "37"], ["Deku", "16"], ["Eren", "19"], ["Vegeta", "48"], ["Saitama", "25"], ["Mikasa", "19"], ["Katara", "16"]]

characters_desc = []
# 1. Create an array of hashes with two keys, name and age. For example [{name: "Goku", age: 37}]
# 2. Store the age in the hash as an integer
characters.each do |character|
  characters_desc << {
    name: character[0],
    age: character[1].to_i
  }  
end

# 4. Add an abilities element(array) to the original array, and add it to the hash. For example [["Goku", 37, ["Kaioken", "Kamekameha"]]]
i = 0
while i < characters.length   # each with index
  character_data = characters[i]
  character_name = character_data[0]

  if character_name == "Goku"
    character_data << ["Kaioken", "Kamekameha"]
  elsif character_name == "Deku"
    character_data << ["One for all", "Situational awareness"]
  elsif character_name == "Eren"
    character_data << ["Attack titan"]
  elsif character_name == "Vegeta"
    character_data << ["Super saiyan"]
  elsif character_name == "Saitama"
    character_data << ["Super punch"]
  elsif character_name == "Mikasa"
    character_data << ["Ackerman blood"]
  elsif character_name == "Katara"
    character_data << ["Water control"]
  end

  characters[i] = character_data
  i += 1
end

characters.each do |original_character_data|
  character_name = original_character_data[0]
  character_abilities = original_character_data[2]

  characters_desc.each do |character_data|
    if character_name == character_data[:name]
      character_data[:ablities] = character_abilities # si es por referencia?
    end
  end
end

# 6. Print the character profile matching the following format:
#  Goku is a 37 years old with and is able to Kaioken, Kamekameha
characters_desc.each do |character|
  name = character[:name]
  age = character[:age]
  abilities = character[:ablities].join(", ")

  puts "#{name} is #{age} years old and is able to #{abilities}"
end