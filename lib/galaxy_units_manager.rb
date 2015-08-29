require 'singleton'
require_relative 'roman_number.rb'
require_relative 'guide_exceptions/galaxy_unit_not_found.rb'

class GalaxyUnitsManager
  include Singleton
  attr_reader :galaxy_unit_to_roman_map

  def initialize
    @galaxy_unit_to_roman_map = {}
  end

  def create_unit(galaxy_unit_name, roman_char)
    galaxy_unit_to_roman_map[galaxy_unit_name] = roman_char
  end

  def galaxy_units_to_human_unit(galaxy_units_str)
    roman = convert_galaxy_units_to_roman(galaxy_units_str.split)
    roman.to_i
  end

  def reset!
    @galaxy_unit_to_roman_map = {}
  end

  private

  def convert_galaxy_units_to_roman(galaxy_units_arr)
    roman_str = galaxy_units_arr.inject('') do |str, galaxy_unit|
      raise GuideExceptions::GalaxyUnitNotFound.new(galaxy_unit) unless galaxy_unit_to_roman_map[galaxy_unit]
      str << galaxy_unit_to_roman_map[galaxy_unit]
    end
    RomanNumber.new(roman_str)
  end

  class << self
    def method_missing(method_name, *args, &block)
      if self.instance.respond_to?(method_name)
        self.instance.public_send(method_name, *args, &block)
      else
        super
      end
    end
  end
end
