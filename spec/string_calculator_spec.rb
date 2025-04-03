require 'rspec'
require_relative '../string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    let(:string_calculator) { StringCalculator.new }

    context "Test case of an empty string, one & two numbers" do
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
    end

    context "Allow the Add method to handle an unknown amount of numbers" do
      it 'returns the sum of n number separated by comma' do
        result = string_calculator.add('1,2,3')
        expect(result).to eq(6)
      end
    end

    context "Allow the Add method to handle new lines between numbers" do
      it 'returns the sum when number has new lines char between numbers' do
        result = string_calculator.add('1\n2,3')
        expect(result).to eq(6)
      end

      it 'returns the INVALID input so do not expect it : “1,\n”' do
        result = string_calculator.add('1,\n')
        expect(result).to eq('Not Allowed')
      end
    end

    context "Support different delimiters" do
      it 'returns the sum of number when delimiters provided' do
        result = string_calculator.add('//;\n1;2')
        expect(result).to eq(3)
      end
    end

    context "Negatives not allowed" do
      it 'throw an exception negatives not allowed and the negative that was passed' do
        expect { string_calculator.add('1,-2,-3') }.to raise_error(RuntimeError, /negative numbers not allowed -2, -3/)
      end
    end
  end
end
