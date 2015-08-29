require 'test_helper'
require 'alien_resource_declaration'

describe CommandHandlers::AlienResourceDeclaration do
  describe '.exec_command' do
    it 'creates new resource with same name and value' do
      GalaxyResourcesManager.reset!
      GalaxyUnitsManager.create_unit('glob', 'I')
      CommandHandlers::AlienResourceDeclaration.exec_command('glob glob Silver is 34 Credits')

      GalaxyResourcesManager.resource_to_credit_map['Silver'].must_equal 17
    end
  end
end
