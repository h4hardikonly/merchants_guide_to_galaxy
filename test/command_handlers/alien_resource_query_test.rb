require 'test_helper'
require 'alien_resource_query'

describe CommandHandlers::AlienResourceQuery do
  describe '.exec_command' do
    before do
      GalaxyResourcesManager.reset!
      GalaxyUnitsManager.create_unit('glob', 'I')
      GalaxyResourcesManager.create_resource('Silver', 4, 50)
    end

    it 'calculates the credit from the command' do
      mocked_method = MiniTest::Mock.new
      mocked_method.expect :call, 25, ['Silver', 2]
      GalaxyResourcesManager.instance.stub :calculate_resource_credit, mocked_method do
        CommandHandlers::AlienResourceQuery.exec_command('how many Credits is glob glob Silver ?')
      end
      mocked_method.verify
    end
  end
end
