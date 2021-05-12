# Ruby Dojo
# Docs:
# https://ruby-doc.org/core-3.0.1/
#

# Perform basic operations with Ruby
# Highlights:
 # - You can perform operations between integers and floats
 # - Keep track of your variables
 
# How to run this file
# 1. Open a terminal and `cd` to where the project is
  # cd path/to/ruby-exercises/Module1/data-types
# 2. Run the file
  # ruby ints_and_floats_exercise.rb

# You can use the method "puts" to output the result to the console
# puts sum
# puts 1 + 2

# Exercise 1:
puts "Add the necessary code to add the necessary numbers to sum 342"
puts 320 + 22

# Exercise 2:
puts "Add the necessary code to substract the necessary numbers to equal -43"
puts 0 - 43

# Exercise 3:
puts "Add the necessary code to multiply the the necessary numbers to get 144"
puts 12 * 12

# Exercise 4:
puts "Add the necessary code to divide the the necessary numbers to get 5"
puts 20 / 4

# Exercise 5:
puts "Calculate the area and perimeter for a square"
side = 5
square_perimeter = side * 4
square_area = side ** 2
puts "Side: #{side} Perimeter: #{square_perimeter} Area: #{square_area}"

# Exercise 6:
puts "Calculate the area and perimeter for a rectangle"
small_side = 2
long_side = 5
rectangle_perimeter = (small_side * 2) + (long_side * 2)
rectangle_area = small_side * long_side
puts "Small side: #{small_side} Long side: #{long_side} Perimeter: #{rectangle_perimeter} Area: #{rectangle_area}"

# Exercise 7:
puts "Calculate the area and perimeter for a triangle"
side_1 = 16.16
side_2 = 16.16
base = 12
height = 15
triangle_perimeter = side_1 + side_2 + base
triangle_area = base * height / 2
puts "Side 1: #{side_1} Side 2: #{side_2} Base: #{base} Height: #{height} Perimeter: #{triangle_perimeter} Area: #{triangle_area}"

# Exercise 8:
puts "Calculate the area and perimeter for a circle"
radius = 5
circle_perimeter = 2 * Math::PI * radius
circle_area = (Math::PI * radius) ** 2
puts "Radius: #{radius} Perimeter: #{circle_perimeter} Area: #{circle_area}"

# Exercise 9:
puts "Get the average age from your family"
avg = (24 + 26 + 30 + 64 + 58) / 5
puts "Average: #{avg}"

# Exercise 10:
puts "Calculate the proportion for each fruit found on a bowl:"
 # 3 bananas, 2 apples, 1 watermelon, 5 kiwis, 10 strawberries
total_fruits = 3 + 2 + 1 + 5 + 10
bananas = (3.0 * 100 / total_fruits).truncate(2)
apples = (2.0 * 100 / total_fruits).truncate(2)
watermelon = (1.0 * 100 / total_fruits).truncate(2)
kiwis = (5.0 * 100 / total_fruits).truncate(2)
strawberries = (10.0 * 100 / total_fruits).truncate(2)
puts "Bananas: #{bananas}% Apples: #{apples}% Watermelon: #{watermelon}% Kiwis: #{kiwis}% Strawberries: #{strawberries}%"


fruits = {
  bananas: 3,
  apples: 2,
  watermelon: 1,
  kiwis: 5,
  strawberries: 10
}

number_of_fruits = fruits.values
total_fruits = number_of_fruits.inject(0, :+)

fruits.each_pair {|fruit_name, count| puts "#{fruit_name}: #{(count * 100.0 / total_fruits).truncate(2)}"}