class StringCalculator
  def add(input)
    if input.chars.count <= 1
      input.empty? ? 0 : input.to_i
    else
      return 'Not Allowed' if input.include?(',\n')

      arr = []
      input.delete(', ').chars.each do |char|
        arr.push(char.to_i)
      end

      arr.sum
    end
  end
end