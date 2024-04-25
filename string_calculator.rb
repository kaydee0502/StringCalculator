class StringCalculator
  def initialize(input)
    @input = input
    @default_delimiter = ','

    check_for_invalid_input
    replace_newline
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
