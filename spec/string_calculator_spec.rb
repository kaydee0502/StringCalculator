# File: string_calculator_spec.rb

require_relative '../string_calculator'

RSpec.describe StringCalculator do
  RSpec::Matchers.define :adds_to do |expected|
    match do |string|
      StringCalculator.new(string).add == expected
    end
  end

  RSpec::Matchers.define :raise_invalid_input do |expected|
    match do |string|
      expect { StringCalculator.new(string) }.to raise_exception(RuntimeError, expected)
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

  describe "#add with given new lines" do
    it "returns 5 if \"1,1\n1,1,0,1\" is passed" do
      expect("1,1\n1,1,0,1").to adds_to(5)
    end

    it "returns 0 if \"0\n0\" is passed" do
      expect("0\n0").to adds_to(0)
    end

    it "raise Invalid input if \"0\n\" is passed" do
      expect("0\n").to raise_invalid_input("Invalid input")
    end

    it "returns 100 if \"20\n20,20\n40\" is passed" do
      expect("20\n20,20\n40").to adds_to(100)
    end
  end

  describe "#add with different delimiter" do
    it "returns 5 if \"//|\n1|1\n1|1|0|1\" is passed" do
      expect("//|\n1|1\n1|1|0|1").to adds_to(5)
    end

    it "returns 18 if \"///\n4/5/6/3\" is passed" do
      expect("///\n4/5/6/3").to adds_to(18)
    end

    it "returns 69 if \"//----\n30----30----3----6\" is passed" do
      expect("//----\n30----30----3----6").to adds_to(69)
    end

    it "raise Invalid input if a number is passed as delimiter is passed" do
      expect("//4\n545").to raise_invalid_input("Integers cannot be used as delimiter")
    end
  end

  describe "#add with negetive numbers" do
    it "raise exception if \"//|\n1|1\n1|-1|0|1\" is passed" do
      expect("//|\n1|1\n1|-1|0|1").to raise_invalid_input("Negetive numbers not allowed: -1")
    end

    it "raise exception if if \"-10,-25,48\" is passed" do
      expect("-10,-25,48").to raise_invalid_input("Negetive numbers not allowed: -10,-25")
    end
  end
end
