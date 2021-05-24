class Puppy
  # Creates an instance variable "state" that you can set in your class.
  # "_reader" means other objects can read your state by calling "some_puppy.state".
  attr_reader :state

  SOUNDS = {
    growling: "Grrrr.",
    angry: "BARK BARK BARK!",
    default: "Bark!"
  }.freeze

  def initialize
    # Puppies are calm at first.
    @state = :calm
  end

  def pet
    @state = @state == :wagging ? :excited : :wagging
  end

  def rub_belly
    @state = :calm
  end

  def spray
    @state = @state == :growling ? :angry : :growling
  end

  def speak
    if SOUNDS.key? @state
      SOUNDS[@state]
    else
      SOUNDS[:default]
    end
  end
end
