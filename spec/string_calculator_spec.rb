require 'rspec'
require_relative '../string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    it 'returns 0 for an empty string' do
      string_calculator = StringCalculator.new
      result = string_calculator.add('')
      expect(result).to eq(0)
    end

    it 'returns the actual number if just one value is supplied' do
      string_calculator = StringCalculator.new
      result = string_calculator.add('1')
      expect(result).to eq(1)
    end
  end
end