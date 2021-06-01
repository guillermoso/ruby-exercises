class User
  attr_reader :email,
              :image_generator,
              :id,
              :image_generator_objects # ? de donde sale esto

  def initialize(email, image_generator)
    @email = email
    @image_generator = image_generator
    @profile_image = nil
    @id = rand(100_000)
    @image_history = []
  end

  def change_id_via_user_input
    @id = get_user_input
  end

  def get_user_input
    gets.chomp.to_i
  end

  # add_image_generators
  def add_image_history(image)
    @image_history << image
  end

  def create_images
    @image_generator.generate_images
  end

  def assign_new_random_image
    @profile_image = random_image
    add_image_history(image)
  end

  def random_image
    @image_generator.generate_images.sample
  end
end
