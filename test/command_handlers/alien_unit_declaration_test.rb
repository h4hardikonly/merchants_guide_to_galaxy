require 'test_helper'
require 'alien_unit_declaration'

describe CommandHandlers::AlienUnitDeclaration do
  describe '.exec_command' do
    it 'register new Alien Unit name and Roman Value' do
      GalaxyUnitsManager.reset!

      mocked_method = MiniTest::Mock.new
      mocked_method.expect :call, true, ['grub', 'X']
      GalaxyUnitsManager.instance.stub :create_unit, mocked_method do
        CommandHandlers::AlienUnitDeclaration.exec_command('grub is X')
      end
      mocked_method.verify
    end
  end
end
