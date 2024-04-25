module Validators
  def check_for_validations(input, delimiter)
    negetive_numbers_check(input, delimiter)
    invalid_input_check(input)
  end

  def negetive_numbers_check(input, delimiter)
    negetive_numbers = input.split(delimiter).select do |unit|
      unit.to_i < 0
    end

    raise "Negetive numbers not allowed: #{negetive_numbers.join(",")}" if negetive_numbers.length > 0
  end

  def invalid_input_check(input)
    raise 'Invalid input' if input.end_with? "\n"
  end
end
