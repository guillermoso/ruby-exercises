# Ruby Dojo
# Docs:
# https://ruby-doc.org/core-3.0.1/
#

# Introduction to enumerables
# Highlights:
 # - The enumerable works on collections, whether arrays or hash
 # - Enumerable implements many each patterns
  
# How to run this file
# 1. Open a terminal and `cd` to where the project is
  # cd path/to/ruby-exercises/Module1/enumerables
# 2. Run the file
  # ruby exercise.rb

# You can use the method "puts" to output the result to the console
# puts a_variable
# puts "Alice"

# Exercise 1:
# Make the following method use #map, instead of #each
def super_heroes
  heroes = ["iron man", "hulk", "black widow", "thor", "captain marvel"]

  # capitalized_heroes = []

  # heroes.each do |heroe|
  #   capitalized_heroes << heroe.capitalize
  # end

  capitalized_heroes = heroes.map do |heroe|
    heroe.capitalize
  end

  capitalized_heroes

  # * heroes.map(&:capitalize) => symbol to proc
end

# Exercise 2:
# Find the first superhero name with a complex name
# A complex name is the one with two words separated by a space
def complex_super_heroe
  heroes = ["iron man", "hulk", "black widow", "thor", "captain marvel"]

  heroes.find do |heroe|
    return heroe if heroe.split.length > 1
  end

  # * heroes.find { |heroe| heore.split.length > 1 }
end

# Exercise 3:
# Given an array of numbers, return the an array of numbers divisible by 5 and 3
# Remember to use an enumerable
def divisible_by_5_and_3
  numbers = (1..100).to_a # this will create an array from 1 to 100. Check the Range class from Ruby - https://ruby-doc.org/core-2.5.1/Range.html

  numbers.select do |number|
    number % 3 == 0 && number % 5 == 0
  end

  # * numbers.select { |number| number % 3 == 0 && number % 5 == 0 }
end

# puts divisible_by_5_and_3

# Exercise 4:
# Given the following code with #each, transform it using an enumerable
def all_zeros?(numbers = [])
  # all_zeros = true
  # numbers.each do |number|
  #   return all_zeros = false if !number.zero?
  # end
  # all_zeros

  # ? hay forma de retornar desde aqui si es verdadero o falso?
  non_zero_number = numbers.find do |number|
    number != 0
  end

  non_zero_number == nil ? true : false

  # * numbers.find { |number| number != 0 } == nil
end

# puts all_zeros? [0,0]

# Exercise 5:
# Complete the following method to meet:
# Check whether the array only has empty strings
# ["", ""] => true
# ["hola", ""] => false
def all_empty?(words = [])

  non_empty_string = words.find do |word|
    word != ""
  end

  non_empty_string == nil ? true : false

  # * words.find { |word| word != 0 } == nil
  # * words.map(&:size).reduce(:+).zero?
  # * words.all? { |word| word.empty || word == ' ' }
end

# puts all_empty? ["", ""]

# Exercise 6:
# Complete the following method to meet:
# Get an array of only full names. Full names are the ones with a last name
# names array example - ["Iron Man", "Hulk", "Goku", "Anakin Skywalker", "Darth Vader", "Gohan"]
def full_names(names = [])
  names.select do |name|
    name.split.length > 1 ? true : false
  end

  # * names.select { |name| name.split.length > 1 } 
end

# names = ["Iron Man", "Hulk", "Goku", "Anakin Skywalker", "Darth Vader", "Gohan"]

# puts full_names names

# Exercise 7:
# Complete the following method to meet:
# Check whether or not the array include "dog". Return a boolean value
def include_dog?(animals = [])
  include_dog = animals.find do |animal|
    animal == "dog"
  end

  include_dog != nil ? true : false

  # * animals.find { |animal| animal == "dog" } == nil
end

animals = ["cat", "elephant", "lion", "dog", "jaguar", "snake"]

# puts include_dog? animals

# Exercise 8:
# Complete the following code to meet:
# Return an array of rounded numbers
# You can use #round method from the Float class
def round_numbers
  numbers = [5.45, 3.99, 4.67, 1.49, 3.14, 9.41]

  numbers.map do |number|
    number.round
  end

  # * numbers.map(&:round)
end

# puts round_numbers

# Exercise 9:
# Complete the following code to meet:
# Return a number with total of elements that match only the numbers that are negative
def total_negative_numbers
  numbers = [0, 3, -1, -45.4, 5, 68, -8]

  negative_numbers = numbers.select do |number|
    number < 0
  end

  negative_numbers.length

  # * numbers.count(&:negative?) => symbol to proc
end

# Exercise 10:
# Using the group_by enumerable method, return a hash grouping the words by lenght, where the key is the length and the value
# is the array with the words matching that
def group_words_by_length
  words = ["alice", "tony", "steve", "carlos", "rick", "martin", "chris", "tom", "david", "megan", "sue"]

  #=> {5 => ["alice", "steve", "carlos", "chris", "david", "megan"], 4 => ["tony", "rick"], 3 => ["sue", "tom"]}

  words.group_by do |word|
    word.length
  end

  # * {}
end

# puts group_words_by_length

def is_prime?(number)
  prime = true
  number.times do |x|
    x += 1
    next if x == 1 || x == number

    prime = false if number % x == 0 
  end

  prime
end

# Exercise 11:
# Using the reject enumerable method, return an array excluding the prime numbers
def exclude_prime_numbers
  numbers = (1..100).to_a

  numbers.reject do |number|
    !is_prime? number # ? reject not prime numbers?
  end
  
  # * numbers.reject { |number| !is_prime? number }
  # primes
  #=> [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
end


# Exercise 12:
# Using the select enumerable method, filter only the heroes that are female
def keep_only_female_heroes
  heroes = [
    {name: "Iron Man", gender: "male"},
    {name: "Black Widow", gender: "female"},
    {name: "Spider Man", gender: "male"},
    {name: "Thor", gender: "male"},
    {name: "Captain Marvel", gender: "female"},
    {name: "The Wasp", gender: "female"},
    {name: "Hulk", gender: "undefined"},
  ]

  heroes.select do |heroe|
    heroe[:gender] == "female"
  end

  # * heroes.select { |heroe| heroe[:gender] == "female" }
  #=> [{name: "Black Widow", gender: "female"}, {name: "Captain Marvel", gender: "female"}, {name: "The Wasp", gender: "female"}]
end

# puts keep_only_female_heroes

# Exercise 13:
# Using the sort_by enumerable method, sort alphabetically by the first letter of the word
def sort_alphabetically_by_first_letter
  countries = ["Mexico", "Canada", "Brazil", "France", "England", "Australia", "United States", "Denmark", "Japan", "Italy"]

  countries.sort_by { |country| country[0] }

  #=> ["Australia", "Brazil", "Canada", "Denmark", "England", "France", "Italy", "Japan", "Mexico", "United States"]

  # countries.sort do |a, b| # ? a,b == country_1, country_2 ?
  #   a_initial = a[0]
  #   b_initial = b[0]

  #   # a < b => -1
  #   # a = b => 0
  #   # a > b => 1
  #   a_initial <=> b_initial
  #   # if b_initial < a_initial
  #   #   return -1
  #   # elsif b_initial > a_initial
  #   #   return 1
  #   # else
  #   #   return 0
  #   # end

  # end
end

# puts sort_alphabetically_by_first_letter