# Exercise 1:
# You are the owner of a Farm with animals, we are modeling that:
# 1. Create a Farm class with name, owner, animals
#   1.1 The class Famr should have the following methods:
#     1.1.1 add_animal - This methods adds an animal to the @animals array for farm
#     1.1.2 animals - Returns the animals array
#     1.1.3 animal_names - Returns an array of the animal names
#     1.1.4 pretty_print - Print the animals on a table, with the name, age and gender, you may need to manipulate a lot of strings for this.
# 2. Create a Cow, Duck, Pig and Horse class
#   2.1 The attributes for the animals above are, name, gender, age
#   2.2 Each animal should the following methods:
#     2.2.1 make_sound - Return a string with the animal sound, like "Muuuu"
#     2.2.2 description - Return a string with the animal description: "My name is Clara the Cow, I have 3 years old and I'm female."
# 3. Create an Owner class
#   3.1 The owner attributes are name, age, gender
#   3.2 The owner should be able to buy animals, therefor a "buy" method, that should also automatically add the animal to the farm

class Farm
    attr_reader :animals

    def initialize(name, owner)
       @name = name
       @owner = owner
       @animals = []
    end

    # This methods adds an animal to the @animals array for farm
    def add_animal(animal)
        @animals << animal
    end
    
    # Returns an array of the animal names
    def animal_names
        @animals.map { |animal| animal.name}
    end

    def longest_animal_name
        @animals.map { |animal| animal.name.length}.max
    end

    # Print the animals on a table, with the name, age and gender, you may need to manipulate a lot of strings for this.
    def pretty_print
        name_row_max_length = self.longest_animal_name

        print_table_header(name_row_max_length)
    
        @animals.each { |animal| print_table_row(animal, name_row_max_length) }
    end

    def print_table_header(name_row_max_length)
        name = "%-#{name_row_max_length}s" % "name"
        puts "| #{name} | age | gender |"
    end

    def print_table_row(animal, name_row_max_length)
        name = "%-#{name_row_max_length}s" % animal.name
        age = "%3s" % animal.age
        gender = "%-6s" % animal.gender

        puts "| #{name} | #{age} | #{gender} |"
    end
end

# 2. Create a Cow, Duck, Pig and Horse class
#   2.1 The attributes for the animals above are, name, gender, age
#   2.2 Each animal should the following methods:
#     2.2.1 make_sound - Return a string with the animal sound, like "Muuuu"
#     2.2.2 description - Return a string with the animal description: "My name is Clara the Cow, I have 3 years old and I'm female."

class Cow
    attr_reader :name, :age, :gender

    def initialize(name, age, gender)
        @name = name
        @age = age
        @gender = gender
    end

    def make_sound
        "Muuuu"
    end

    def description
        "My name is #{@name}, I am #{@age} years old and I'm #{@gender}"
    end
end

class Duck
    attr_reader :name, :age, :gender

    def initialize(name, age, gender)
        @name = name
        @age = age
        @gender = gender
    end

    def make_sound
        "Cuack Cuack"
    end

    def description
        "My name is #{@name}, I am #{@age} years old and I'm #{@gender}"
    end
end

class Pig
    attr_reader :name, :age, :gender

    def initialize(name, age, gender)
        @name = name
        @age = age
        @gender = gender
    end

    def make_sound
        "Oink Oink"
    end

    def description
        "My name is #{@name}, I am #{@age} years old and I'm #{@gender}"
    end
end

class Horse
    attr_reader :name, :age, :gender

    def initialize(name, age, gender)
        @name = name
        @age = age
        @gender = gender
    end

    def make_sound
        "Hello, I'm a horse that speaks english"
    end

    def description
        "My name is #{@name}, I am #{@age} years old and I'm #{@gender}"
    end
end

# 3. Create an Owner class
#   3.1 The owner attributes are name, age, gender
#   3.2 The owner should be able to buy animals, therefor a "buy" method, that should also automatically add the animal to the farm
class Owner
    attr_reader :name, :age, :gender

    def initialize(name, age, gender)
        @name = name
        @age = age
        @gender = gender
    end

    def buy(farm, animal, name, age, gender)
        valid_animals = ["cow", "duck", "pig", "horse"]

        if !valid_animals.include? animal
            puts "Invalid animal"
            return
        end

        animal = Object.const_get(animal.capitalize).new(name, age, gender)        
        farm.add_animal(animal)
    end 
end

pedro = Owner.new("Pedro", 30, "male")

el_sufrido = Farm.new("Rancho 'El surfido'", pedro)

pedro.buy(el_sufrido, "test", "Juanito", 5, "male")
pedro.buy(el_sufrido, "pig", "Nombresuperlargo", 5, "male")
pedro.buy(el_sufrido, "cow", "Conchita", 5, "female")

puts el_sufrido.pretty_print