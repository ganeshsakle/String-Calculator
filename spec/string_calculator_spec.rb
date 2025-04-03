require 'rspec'
require_relative '../string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    let(:string_calculator) { StringCalculator.new }

    it 'returns 0 for an empty string' do
      result = string_calculator.add('')
      expect(result).to eq(0)
    end

    it 'returns the actual number if just one value is supplied' do
      result = string_calculator.add('1')
      expect(result).to eq(1)
    end

    it 'calculates the total of two numbers if they are separated by a comma' do
      result = string_calculator.add('1,2')
      expect(result).to eq(3)
    end

    it 'returns the sum of n number separated by comma' do
      result = string_calculator.add('1,2,3')
      expect(result).to eq(6)
    end

    it 'returns the sum when number has new lines char between numbers' do
      result = string_calculator.add('1\n2,3')
      expect(result).to eq(6)
    end
  end
end