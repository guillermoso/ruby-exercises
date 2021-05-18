# Ruby Dojo
# Docs:
# https://ruby-doc.org/core-3.0.1/
#

# Working with Nested Collections in Ruby
# Highlights:
 # - You can nested hash into arrays and the other way around
 # - You can modify the content of any of the nested collections
 # - You can remove elements from the collections
  
# How to run this file
# 1. Open a terminal and `cd` to where the project is
  # cd path/to/ruby-exercises/Module1/nested-collections
# 2. Run the file
  # ruby exercise.rb

# You can use the method "puts" to output the result to the console
# puts a_variable
# puts ["Luke", "Yoda"]

# Exercise 1:
# Sum all the elements from a nested array
# HINT: Try using map and reduce
def sum_nested_collection
  nested_numbers = [[1,2,3], [5,6,7,5], [9,10,13,6], [1]]

  nested_numbers.map { |numbers| numbers.reduce(:+) }.reduce(:+)

end

puts sum_nested_collection

# Exercise 2:
# Given the following data collections
COUNTRIES = {
  "United States" => "US",
  "Mexico" => "MX",
  "Canada" => "CA",
  "Rusia" => "RU",
  "France" => "FR"
}

CAPITALS = {
  "US" => "Washington DC",
  "MX" => "CDMX",
  "CA" => "Ottawa",
  "RU" => "Moscow",
  "FR" => "Paris"
}

# FIXME: refactor into a class

# 1. Create a method that receives a country name and return the abbreviation
def abbreviate_country(country)
  COUNTRIES[country]
end

puts abbreviate_country "Mexico"

# 2. Create a method that receives a country and outputs its capital
def countrys_capital(country)
  countrys_name = COUNTRIES[country]
  CAPITALS[countrys_name]
end

puts countrys_capital "Canada"

# 3. Create a method that receives a capital and return the country name
def capitals_country(capital)
  countries_abbr = CAPITALS.find { |abbr, cap| capital == cap }[0]

  COUNTRIES.find { |country, abbr| countries_abbr == abbr}[0]
end

puts capitals_country "Moscow"

# 4. Create a method to create a hash that looks like this:
# {
#   "United States" => { abbreviation: "US", capital: "Washington DC" },
#   "Mexico" => { abbreviation: "MX", capital: "CDMX" },
#   "Canada" => { abbreviation: "CA", capital: "Ottawa" }
#   "Rusia" => { abbreviation: "RU", capital: "Moscow" },
#   "France" => { abbreviation: "FR", capital: "Paris" },
# }
def format_countries()
  new_format = {}

  COUNTRIES.each do |country, abbr|
    new_format[country] = {}
    new_format[country]["abbreviation"] = abbr 
    new_format[country]["capital"] = CAPITALS[abbr]
  end

  new_format
end

puts format_countries
