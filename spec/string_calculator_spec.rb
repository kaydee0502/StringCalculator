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

    it "returns 6 if \"1,5\" string is passed" do
      expect("1,5").to adds_to(6)
    end
  end
end
