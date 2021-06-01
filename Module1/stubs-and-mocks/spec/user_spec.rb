require 'rspec'
require './lib/image_generator'
require './lib/user'

RSpec.describe User do
  describe '#initialize' do
    it 'exists' do
      # I pass a real image generator object - this is potentially slow and costly
      # Lets mock this object whenever possible
      image = instance_double(ImageGenerator)
      user = User.new("t@gmail.com", image)
      expect(user).to be_a User
    end

    it 'has attributes' do
      # I don't need an actual ImageGenerator object. I use a mock instead.
      mock_image_generator = instance_double("Image", max_image_size: 45)
      user = User.new("t@gmail.com", mock_image_generator)

      expect(user.email).to eq "t@gmail.com"
      expect(user.image_generator).to eq mock_image_generator

      allow(user).to receive(:id).and_return(123)
      expect(user.id).to eq 123
    end
  end

  describe "#get_user_input" do
    it "returns an integer captured by the user" do
      mock_image_generator = instance_double("Image", max_image_size: 45)
      user = User.new("t@gmail.com", mock_image_generator)
      allow(user).to receive(:get_user_input).and_return(123)

      user_input = user.get_user_input

      expect(user_input).to eql 123
      expect(user_input).to be_a Integer
    end
  end

  describe "#change_id_via_user_input" do
    it "changes the value of the 'id' attribute" do
      mock_image_generator = instance_double("Image", max_image_size: 45)
      user = User.new("t@gmail.com", mock_image_generator)
      allow(user).to receive(:get_user_input).and_return(123)

      new_user_id = user.change_id_via_user_input

      expect(new_user_id).to eql 123
      expect(user.id).to eql 123
    end
  end

  describe "#add_image_history" do
    it "adds an image to the @image_history array" do
      mock_image_generator = instance_double("Image", max_image_size: 45)
      user = User.new("t@gmail.com", mock_image_generator)

      new_image_history = user.add_image_history("image")

      expect(new_image_history).to eql ["image"]
    end
  end

  describe "#create_images" do
    it "returns array of generated images" do
      mock_image_generator = instance_double("Image", max_image_size: 45)
      allow(mock_image_generator).to receive(:generate_images).and_return(%w[image1 image123])
      user = User.new("t@gmail.com", mock_image_generator)

      created_images = user.create_images

      expect(created_images).to eql %w[image1 image123]
    end
  end

  describe "#random_image" do
    it "returns a newly random generated image"do
    mock_image_generator = instance_double("Image", max_image_size: 45)
    allow(mock_image_generator).to receive(:generate_images).and_return(%w[image13])
    user = User.new("t@gmail.com", mock_image_generator)

    random_image = user.random_image

    expect(random_image).to eql "image13"
    end
  end

  # ? como probar que asigna una nueva imagen cuando ambas 
  # ? propiedades utilizadas por el metodo son privadas?
  # describe "#assign_new_random_image" do
  #   it ""
  # end
end
