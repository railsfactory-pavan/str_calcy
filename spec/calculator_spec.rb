require_relative '../calculator'

describe Calculator do
	describe '#add' do
		it 'returns 0 if empty string is passed' do
      calculator = Calculator.new
      expect(calculator.add('')).to eq(0)
    end

    it 'returns number itself if only numbers are present in string' do
      calculator = Calculator.new
      expect(calculator.add('123')).to eq(123)
    end

    it 'returns sum of numbers if multiple number are present delimited by comma or new line' do
      calculator = Calculator.new
      expect(calculator.add('1,2,3')).to eq(6)
      expect(calculator.add("1\n2\n3")).to eq(6)
    end

    it 'returns sum of numbers when delimiter is changed' do
      calculator = Calculator.new
      expect(calculator.add('\\;1;2;3')).to eq(6)
      expect(calculator.add("\\\n2\n3")).to eq(5)
    end

    it 'returns an exception when negative numbers are passed' do
      calculator = Calculator.new
      expect { calculator.add('\\;1;-2;3') }.to(
        raise_error do |error|
          expect(error).to be_a(InvalidInput)
          expect(error.message).to eq 'Negative numbers not allowed -2'
        end
      )
      expect { calculator.add("\\\n-2\n-3") }.to(
        raise_error do |error|
          expect(error).to be_a(InvalidInput)
          expect(error.message).to eq 'Negative numbers not allowed -2,-3'
        end
      )
    end
	end
end
