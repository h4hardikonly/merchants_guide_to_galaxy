require 'test_helper'
require 'roman_number'

describe RomanNumber do
  describe 'when input string is valid' do
    describe '#valid?' do
      it 'returns true' do
        RomanNumber.new('CDXX').valid?.must_equal true
      end
    end
  end

  describe 'when input string is Invalid' do
    it 'must fail when roman numeral with twice L' do
      -> { RomanNumber.new('LLC') }.must_raise GuideExceptions::InvalidRomanNumber
    end

    it 'must fail when large roman numeral is preceeded by two small numeral' do
      -> { RomanNumber.new('IIV') }.must_raise GuideExceptions::InvalidRomanNumber
    end

    it 'must fail when roman numeral X repeated more than thrice' do
      -> { RomanNumber.new('XXXXI') }.must_raise GuideExceptions::InvalidRomanNumber
    end

    it 'must fail when roman numeral with I followed by L' do
      -> { RomanNumber.new('IL') }.must_raise GuideExceptions::InvalidRomanNumber
    end

    it 'must fail when roman numeral with X followed by D' do
      -> { RomanNumber.new('XD') }.must_raise GuideExceptions::InvalidRomanNumber
    end

    it 'must fail when roman numeral with V followed by X' do
      -> { RomanNumber.new('VX') }.must_raise GuideExceptions::InvalidRomanNumber
    end

    it 'must fail when roman numeral with L followed by C' do
      -> { RomanNumber.new('LC') }.must_raise GuideExceptions::InvalidRomanNumber
    end

    it 'must fail when roman numeral with D followed by M' do
      -> { RomanNumber.new('DM') }.must_raise GuideExceptions::InvalidRomanNumber
    end
  end

  describe '#to_i' do
    it 'returns the correct value of I' do
      RomanNumber.new('I').to_i.must_equal 1
    end
    it 'returns the correct value of IV' do
      RomanNumber.new('IV').to_i.must_equal 4
    end
    it 'returns the correct value of VIII' do
      RomanNumber.new('VIII').to_i.must_equal 8
    end
    it 'returns the correct value of XI' do
      RomanNumber.new('XI').to_i.must_equal 11
    end
    it 'returns the correct value of XL' do
      RomanNumber.new('XL').to_i.must_equal 40
    end
    it 'returns the correct value of LVII' do
      RomanNumber.new('LVII').to_i.must_equal 57
    end
    it 'returns the correct value of MMMMCMXCIX' do
      RomanNumber.new('MMMMCMXCIX').to_i.must_equal 4999
    end
  end
end
