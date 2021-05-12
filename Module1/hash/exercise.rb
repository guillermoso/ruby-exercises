# Ruby Dojo
# Docs:
# https://ruby-doc.org/core-3.0.1/
#

# Working with Hash in Ruby
# Highlights:
 # - You can join join hashes using the "merge" method
 # - You can modify the content of a hash
 # - You can remove elements from a hash 
  
# How to run this file
# 1. Open a terminal and `cd` to where the project is
  # cd path/to/ruby-exercises/Module1/hash
# 2. Run the file
  # ruby exercise.rb

# You can use the method "puts" to output the result to the console
# puts a_variable
# puts { name: "Alice" }

# Exercise 1:
# Use a method to get the keys of a hash
heroe = {
  name: "Hulk",
  real_name: "Bruce Banner",
  powers: ["Smashes", "Strength", "Bullet proof"]
}
puts heroe.keys.inspect
#=> [:name, :real_name, :powers]

# Exercise 2:
# Use a method to remove the real_name key from the hash
heroe = {
  name: "Hulk",
  real_name: "Bruce Banner",
  powers: ["Smashes", "Strength", "Bullet proof"]
}
puts heroe.delete(:real_name)
#=> "Bruce Banner"

# Exercise 3:
# Add a power to the heroe(you can change it if you like)
heroe = {
  name: "Hulk",
  real_name: "Bruce Banner",
  powers: ["Smashes", "Strength", "Bullet proof"]
}
#=> ["Smashes", "Strength", "Bullet proof", "Is green"]
heroe[:powers] << "Is blue"
puts heroe.inspect

# Exercise 4:
# Join the two hashes so Hulk has the right set of powers
heroe = {
  name: "Hulk",
  real_name: "Bruce Banner",
  powers: ["Spider sense", "Web usage", "Crawl walls"]
}

real_powers = {
  powers: ["Smashes", "Strength", "Bullet proof"]
}
#=> { name: "Hulk", real_name: "Bruce Banner", powers: ["Smashes", "Strength", "Bullet proof"]}
puts heroe.merge(real_powers).inspect


# Exercise 5:
# Create a Hash with ths states form Mexico, use an abbreviation as key and the full name as the value
# Ex. Nuevo Leon is the full name and NL would be the key
states = {
  AGU: "Aguascalientes",
  BCN: "Baja California",
  BCS: "Baja California Sur",
  CAM: "Campeche",
  CHP: "Chiapas",
  CHH: "Chihuahua",
  C​MX: "Ciudad de México",
  COA: "Coahuila",
  COL: "Colima",
  DUR: "Durango",
  GUA: "Guanajuato",
  GRO: "Guerrero",
  HID: "Hidalgo",
  JAL: "Jalisco",
  MEX: "México",
  MIC: "Michoacán",
  MOR: "Morelos",
  NAY: "Nayarit",
  NLE: "Nuevo León",
  OAX: "Oaxaca",
  PUE: "Puebla",
  QUE: "Querétaro",
  ROO: "Quintana Roo",
  SLP: "San Luis Potosí",
  SIN: "Sinaloa",
  SON: "Sonora",
  TAB: "Tabasco",
  TAM: "Tamaulipas",
  TLA: "Tlaxcala",
  VER: "Veracruz",
  YUC: "Yucatán",
  ZAC: "Zacatecas"
}

# Exercise 6:
# Describe yourself as a Hash, some ideas would be, name, age, hobbies, email, gender, etc
# Try to use different data types as the values, such as strings, arrays, floats
memo = {
  full_name: "Guillermo Alvarez",
  age: 24,
  hobbies: ["horticulture", "school", "reading", "cod"],
  contact: {
    email: "guillermo@icalialabs.com",
    address: {
      city: "Ciudad Juarez",
      state: "CHH"
    }
  }
}

# Exercise 7:
# The hash below stores data regarding what is on my fridge
fruits = {
  apple: 3,
  watermelon: 1,
  orange: 5
}
# Please print with a string following the next format:
# There are 3 apples on the fridge
# My only 1 watermelon takes all the space on my fridge =(
# How much juice would I get from 5 oranges?
puts "There are #{fruits[:apple]} apples on the fridge"
puts "My only #{fruits[:watermelon]} watermelon takes all the space on my fridge =("
puts "How much juice would I get from #{fruits[:orange]} oranges?"

# Exercise 8:
# Grab the hash created back on exercise 5, and get the name for all the states
puts states.values.inspect
# => ["Aguascalientes", "Nuevo Leon"...]

# Exersice 9:
# This is a bit more complex exercise:
# 1. List only the avengers names
# 2. Add a villain to the array, some ideas. Venom, Hela, Dormamu
# 3. Add another key with avengers without powers. War Machine, Iron Man, Hawkeye, Black Widow
# 4. Reset the whole hash to store nothing
characters = {
  avengers: [
    { name: "Spider Man" },
    { name: "Captain Marvel" },
    { name: "Wanda" },
    { name: "Thor" }
  ],
  villains: [
    { name: "Loki" },
    { name: "Thanos" },
    { name: "Venom" },
    { name: "Ragnarok" }
  ]
}

puts "List only the avengers names"
puts characters[:avengers].inspect

puts "Add a villain to the array, some ideas. Venom, Hela, Dormamu"
puts characters[:villains] << { name: "Dormamu" }

puts "Add another key with avengers without powers. War Machine, Iron Man, Hawkeye, Black Widow"
characters[:other_avengers] = [
  {name: "War Machine"},
  {name: "Iron Man"},
  {name: "Hawkeye"},
  {name: "Black Widow"}
]

puts "Reset the whole hash to store nothing"
puts characters.clear