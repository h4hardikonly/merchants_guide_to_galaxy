require_relative 'guide_exceptions/invalid_roman_number.rb'

class RomanNumber
  VALID_PATTERN = /^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/

  ROMAN_MAP = {
    "M"  => 1000,
    "CM" => 900,
    "D"  => 500,
    "CD" => 400,
    "C"  => 100,
    "XC" => 90,
    "L"  => 50,
    "XL" => 40,
    "X"  => 10,
    "IX" => 9,
    "V"  => 5,
    "IV" => 4,
    "I"  => 1
  }

  attr_accessor :roman_number_str

  def initialize(roman_number_str)
    @roman_number_str = roman_number_str.strip
    raise GuideExceptions::InvalidRomanNumber.new unless self.valid?
  end

  def to_i(str = roman_number_str, integer = 0)
    return integer if str.empty?

    ROMAN_MAP.keys.each do |roman|
      if str.start_with?(roman)
        integer += ROMAN_MAP[roman]
        str = str.slice(roman.length, str.length)
        return to_i(str, integer)
      end
    end
  end

  def valid?
    !!(roman_number_str =~ VALID_PATTERN)
  end
end
