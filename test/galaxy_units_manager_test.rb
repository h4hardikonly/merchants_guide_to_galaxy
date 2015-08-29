require 'test_helper'
require 'galaxy_units_manager'

describe GalaxyUnitsManager do
  describe '#create_unit' do
    it 'updates galaxy_unit_to_roman_map with input' do
      GalaxyUnitsManager.reset!
      GalaxyUnitsManager.create_unit('glob', 'I')
      GalaxyUnitsManager.galaxy_unit_to_roman_map['glob'].must_equal 'I'
    end
  end

  describe '#galaxy_units_to_human_unit' do
    describe 'when galaxy unit is registered' do
      it 'returns human integer value of input galaxy unit' do
        GalaxyUnitsManager.reset!
        GalaxyUnitsManager.create_unit('glob', 'I')
        GalaxyUnitsManager.galaxy_units_to_human_unit('glob glob').must_equal 2
      end
    end

    describe 'when galaxy unit is not registered' do
      it 'raises GalaxyUnitNotFound exception' do
        GalaxyUnitsManager.reset!
        -> { GalaxyUnitsManager.galaxy_units_to_human_unit('glob glob') }.must_raise GuideExceptions::GalaxyUnitNotFound
      end
    end
  end

  describe '#reset!' do
    it 'resets the galaxy_unit_to_roman_map' do
      GalaxyUnitsManager.create_unit('glob', 'I')
      GalaxyUnitsManager.reset!
      GalaxyUnitsManager.galaxy_unit_to_roman_map.size.must_equal 0
    end
  end
end
