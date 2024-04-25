# File: calculator_spec.rb

require_relative '../string_calculator'

RSpec.describe StringCalculator do
  let(:calc) { StringCalculator.new }

  RSpec::Matchers.define :adds_to do |expected|
    match do |string|
      calc.add(string) == expected
    end
  end

  describe "#add" do
    it "returns 0 if empty string is passed" do
      expect("").to adds_to(0)
    end

    it "returns 1 if \"1\" is passed" do
      expect("1").to adds_to(1)
    end

    it "returns 6 if \"1,5\" is passed" do
      expect("1,5").to adds_to(6)
    end
  end

  describe "#add multiple numbers" do
    it "returns 12 if \"1,5,6\" is passed" do
      expect("1,5,6").to adds_to(12)
    end

    it "returns 83 if \"10,25,48\" is passed" do
      expect("10,25,48").to adds_to(83)
    end

    it "returns 5 if \"1,1,0,1,1,0,1\" is passed" do
      expect("1,1,0,1,1,0,1").to adds_to(5)
    end
  end
end
