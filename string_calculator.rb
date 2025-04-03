# frozen_string_literal: true

class StringCalculator
  def add(input)
    return 0 if input.empty?

    return 'Not Allowed' if input.include?(',\n')

    delimiter = extract_delimiter(input)
    input = input.sub('//[^\n]*\n', '') if input.start_with?('//')

    input.tr('\n', delimiter).split(delimiter).map(&:to_i).sum
    numbers_array = input.tr('\n', delimiter).split(delimiter).map(&:to_i)

    raise_negatives_exception(numbers_array)

    numbers_array.reject! { |num| num > 1000 }

    numbers_array.sum
  end

  private

  def extract_delimiter(numbers)
    numbers.start_with?('//') ? numbers.split('\n', 2).first[-1] : ','
  end

  def raise_negatives_exception(numbers_array)
    raise_negative_exception(numbers_array) if negatives_found?(numbers_array)
  end

  def negatives_found?(numbers_array)
    numbers_array.any?(&:negative?)
  end

  def raise_negative_exception(numbers_array)
    negatives = numbers_array.select(&:negative?)

    raise "negative numbers not allowed #{negatives.join(', ')}"
  end
end
