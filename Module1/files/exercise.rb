# Ruby Dojo
# Docs:
# https://ruby-doc.org/core-3.0.1/
#

# Working with Files in Ruby
# Highlights:
  # - You can use the open method from the File class, to read or create files
  # - There are a bunch of modes to open a file:
  #   r - Read only. The file must exist.
  #   w - Create an empty file for writing.
  #   a - Append to a file.The file is created if it does not exist.
  #   r+ - Open a file for update both reading and writing. The file must exist.
  #   w+ - Create an empty file for both reading and writing.
  #   a+ - Open a file for reading and appending. The file is created if it does not exist.

  
# How to run this file
# 1. Open a terminal and `cd` to where the project is
  # cd path/to/ruby-exercises/Module1/inheritance
# 2. Run the file
  # ruby exercise.rb

# You can use the method "puts" to output the result to the console
# puts a_variable
# puts { name: "Alice" }

# Exercise 1:
# Given the file avenger_quotes.txt
# 1. Create a method to read the file
# 2. Read each line and create a hash for each superhero to save the quotes:
#   2.1 { name: "Tony Stark", quotes: [...] }
# 3. Create a json file with the structure generated above. One file per character. Checkout the json library - https://ruby-doc.org/stdlib-3.0.1/libdoc/json/rdoc/JSON.html
# 4. Read each json file, and create a new txt file to add the avengers quotes in uppercase, just like the original file, but in caps.

require 'json'

class AvengerQuotesReader
  def initialize
    @folder = "/home/memo/proyects/ruby-exercises/Module1/files/"
    @avengers_file = "avenger_quotes.txt"
  end

  def process_file

    file = File.open("#{@folder}#{@avengers_file}", "r")

    @lines_by_character ||= file.readlines.map { |line| map_line_into_hash(line) }
                .select { |line| line != false }
                .group_by { |hash_line| hash_line[:name] }
                .map do |character, hash_lines|
                  {
                    name: character,
                    quotes: hash_lines.map { |hash_line| hash_line[:quote] }
                  }
                end

    file.close

    @lines_by_character

  end

  def map_line_into_hash(line = "")
    line_split = line.split(": ")
    
    if line_split.length > 1
      return {
        name: line_split[0],
        quote: line_split[1].chomp
      }
    end

    false
  end

  def generate_character_files
    if !defined? @lines_by_character
      raise NameError, "undefined instance variable 'lines_by_character'"
    end

    @lines_by_character.each do |character|
      write_hash_to_json character[:name], character
    end
  end

  def write_hash_to_json(filename, hash)
    file = File.open("#{@folder}#{filename}.json", "w") 
    file.write(JSON.generate(hash))
    file.close
  end

  def capitalize_character_quotes
    read_character_json_files.map do |character|
      {
        name: character["name"],
        quotes: character["quotes"].map { |quote| quote.upcase }
      }
    end.each { |character| write_hash_to_json("#{character[:name]}_capitalized", character)}
  end

  def read_character_json_files
    Dir["#{@folder}*.json"].map do |json_file|
      file = File.open(json_file, "r") 
      character_json = JSON.parse(file.readline)
      file.close

      character_json
    end
  end
end

avengers = AvengerQuotesReader.new

avengers.process_file

avengers.generate_character_files

avengers.capitalize_character_quotes




#Docs:https://rbrking with Files in Rubyghlights:- You can use the o- There are a bunch  r - Read only. The file must exist.  w - Create an empty file for wr#  #   r+ - Open a file for update both reading and writing. The file must exist.
  #   w+ - Create an empty file for both reading and writing.
  #   a+ - Open a file for reading and appending. The file is created if it does not exist.


# How to run this file
# 1. Open a terminal and `cd` to where the project is
  # cd path/to/ruby-exercises/Module1/inheritance
# 2. Run the file
  # ruby exercise.rb

# You can use the method "puts" to output the result to the console
# puts a_variable
# puts { name: "Alice" }

# Exercise 1:
# Given the file avenger_quotes.txt
# 1. Create a method to read the file
# 2. Read each line and create a hash for each superhero to save the quotes:
#   2.1 { name: "Tony Stark", quotes: [...] }
# 3. Create a json file with the structure generated above. One file per character. Checkout the json library - https://ruby-doc.org/stdlib-3.0.1/libdoc/json/rdoc/JSON.html
# 4. Read each json file, and create a new txt file to add the avengers quotes in uppercase, just like the original file, but in caps.


require 'json'

class SuperHero
  attr_reader :name, :quotes

  def initialize(name)
    @name = name
    @quotes = []
  end

  def add_quote(quote)
    @quotes << quote
  end

  def to_h
    {
      name: @name,
      quotes: @quotes
    }
  end

  def to_json
    to_h.to_json
  end
end

class FileReader
  def initialize(file)
    @file = file
    # @super_heroes = []
  end

  def read_file(&block)
    File.readlines(@file).each do |line|
      next if line.tr("\n", '').empty?
      yield(line) if block_given?
    end
  end
end

class SuperHeroes
  def initialize
    @file_reader = FileReader.new("./avenger_quotes.txt")
    @collection = []
  end

  def collection
    @file_reader.read_file do |line|
      name, quote = line.tr("\n", '').split(':')
      @collection << super_heroe(name, quote)
    end

    @collection.uniq!
  end

  def super_heroe(name, quote)
    super_heroe = @collection.find { |heroe| heroe.name == name } || SuperHero.new(name)
    super_heroe.add_quote(quote)
    super_heroe
  end
end

module HeroeTextFileGenerator
  def self.generate(heroe)
    file = File.open("#{heroe.name}_upcase.txt", 'w')     # hero + "_upcase.json" ?
    heroe.quotes.each do |quote|
      file.write("#{heroe.name}: #{quote.upcase}\n\n")
    end
    file.close
  end
end

module HeroeJsonFileGenerator
  def self.generate(heroe)
    file = File.open("#{heroe.name}.json", 'w')
    file.write(heroe.to_json)
    file.close
  end
end

module FileGenerator
  FILE_GENERATORS = {
    json: HeroeJsonFileGenerator,
    txt: HeroeTextFileGenerator
  }

  def self.to_file(heroe:, format: :json)
    FILE_GENERATORS[format].generate(heroe)
  end
end

class Application
  def generate_files(format:)
     super_heroes.each do |super_heroe|
      FileGenerator.to_file(heroe: super_heroe, format: format.to_sym)
     end
  end

  private

  def super_heroes
    @super_heroes ||= SuperHeroes.new.collection
  end
end


application = Application.new

# puts file.read_file
puts application.generate_files(format: :json)
puts application.generate_files(format: :txt)
