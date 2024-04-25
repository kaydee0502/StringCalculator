class StringCalculator
  def add(input)
    input.split(",").map do |unit|
      unit.to_i
    end.sum
  end
end
