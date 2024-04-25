require_relative 'validators'

class StringCalculator
  include Validators

  def initialize(input)
    @input = input
    @default_delimiter = ','
    @errors = false

    apply_custom_delimiter if @input.start_with? '//'

    @valid_input = false
    validate_input
    replace_newline
  end

  def add
    raise 'Validations falied' unless  @valid_input

    @input.split(@default_delimiter).map do |unit|
      unit.to_i
    end.sum
  end

  private

  def validate_input
    check_for_validations(@input, @default_delimiter)
    @valid_input = true
  end

  def apply_custom_delimiter
    # Split input from first new line and exclude starting //
    delimiter = @input.split("\n", 2)[0][2..-1]
    raise "Integers cannot be used as delimiter" if valid_integer?(delimiter)

    @default_delimiter = delimiter
  end

  def valid_integer?(input)
    !!Integer(input) rescue false
  end

  def replace_newline
    @input = @input.gsub("\n", @default_delimiter)
  end
end
