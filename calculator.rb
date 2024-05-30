require 'debug'

require_relative './exceptions/invalid_input'

class Calculator
	DIGITS_REGEXP = Regexp.new(/(\d+)/)
  NEGATIVE_DIGITS_REGEXP = Regexp.new(/(-\d+)/)

	def add(given_str)
		negative_numbers = given_str.scan(NEGATIVE_DIGITS_REGEXP).flatten

    if !negative_numbers.empty?
      raise InvalidInput.new("Negative numbers not allowed #{negative_numbers.join(',')}")
    end

    given_str.scan(DIGITS_REGEXP).flatten.map(&:to_i).sum
	end
end

obj = Calculator.new

puts "Results..."

puts obj.add(",1,2,3,,/n,/n,4,5,6,/n,7,+,-,*")
