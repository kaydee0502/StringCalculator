class StringCalculator
  def initialize(input)
    @input = input
    @default_delimiter = ','

    check_for_invalid_input
    apply_custom_delimiter if @input.start_with? '//'
    replace_newline
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

  def check_for_invalid_input
    raise "Invalid input" if @input.end_with? "\n"
  end

  def replace_newline
    @input = @input.gsub("\n", @default_delimiter)
  end

  def add
    @input.split(@default_delimiter).map do |unit|
      unit.to_i
    end.sum
  end
end
