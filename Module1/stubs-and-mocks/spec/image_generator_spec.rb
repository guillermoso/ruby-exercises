require 'rspec'
require './lib/image_generator'

RSpec.describe ImageGenerator do
  before(:all) do
    @image_generator = ImageGenerator.new(2500)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@image_generator).to be_a ImageGenerator
    end

    it 'has attributes' do
      expect(@image_generator.max_image_size).to eq 2500
    end

    # Using stubs write the tests to confirm the functionality
    # that exists in ./lib/image_generator.rb
  end

  # ? cual es el valor real de estos tests?
  # ? la implementacion podria cambiar y como se esta haciendo
  # ? un stub del metodo la prueba va a pasar

  describe "#generate_images" do
    it "returns an array" do
      expect(@image_generator.generate_images).to be_a Array
    end

    it "returns an array of images" do
      image_generator = instance_double(ImageGenerator)
      allow(image_generator).to receive(:generate_images)
        .and_return(%w[image1 image123])

      generated_images = image_generator.generate_images

      expect(generated_images).to eq %w[image1 image123]
    end
  end

  describe "#change_max_size" do
    # ? como se haria el stub de una variable de instancia?
    # ? para combrobar que el valor de la variable si esta cambiando
    # ? y no solo lo que regresa el metodo
    it "updates the max_image_size" do
      image_generator = instance_double(ImageGenerator)
      allow(image_generator).to receive(:change_max_size)
        .with(10)
        .and_return(523)

      new_max_size = image_generator.change_max_size(10)

      expect(new_max_size).to eql 523
    end
  end
end
