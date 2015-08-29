require 'test_helper'
require 'alien_unit_query'

describe CommandHandlers::AlienUnitQuery do
  describe '.exec_command' do
    it 'calculates the integer value of Alien unit' do
      GalaxyUnitsManager.reset!

      mocked_method = MiniTest::Mock.new
      mocked_method.expect :call, true, ['pish tegj glob glob ']
      GalaxyUnitsManager.instance.stub :galaxy_units_to_human_unit, mocked_method do
        CommandHandlers::AlienUnitQuery.exec_command('how much is pish tegj glob glob ?')
      end
      mocked_method.verify
    end
  end
end
