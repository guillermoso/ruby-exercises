require "./spec_helper"
require "../lib/puppy"

describe Puppy do
  describe "#initialize" do
    it "Puppies should be calm at first" do
      puppy = Puppy.new

      expect(puppy.state).to eql :calm
    end
  end

  describe "#speak" do
    context "Puppy makes different noises depending on his state" do
      it "when calm they bark happily" do
        puppy = Puppy.new

        noise = puppy.speak

        expect(noise).to eql "Bark!"
      end

      it "When growling they make a growl noise" do
        puppy = Puppy.new

        puppy.spray
        sound = puppy.speak

        expect(sound).to eql "Grrrr."
      end

      it "When angry they bark agresively" do
        puppy = Puppy.new

        puppy.spray
        puppy.spray
        sound = puppy.speak

        expect(sound).to eql "BARK BARK BARK!"
      end
    end
  end

  describe "#pet" do
    it "Makes the puppy wag its tail when pet once" do
      puppy = Puppy.new

      puppy.pet

      expect(puppy.state).to eql :wagging
    end

    it "Makes the puppy excited when pet twice" do
      puppy = Puppy.new

      puppy.pet
      puppy.pet

      expect(puppy.state).to eql :excited
    end
  end

  describe "#spray" do
    it "Makes the puppy growl if sprayed once" do
      puppy = Puppy.new

      puppy.spray

      expect(puppy.state).to eql :growling
    end

    it "Makes the puppy angry if sprayed twice" do
      puppy = Puppy.new

      puppy.spray
      puppy.spray

      expect(puppy.state).to eql :angry
    end
  end

  describe "#rub_belly" do
    it "Calms puppies down, no matter how angry or excited they are" do
      puppy = Puppy.new

      puppy.spray
      puppy.spray
      puppy.rub_belly

      expect(puppy.state).to eql :calm
    end
  end
end
