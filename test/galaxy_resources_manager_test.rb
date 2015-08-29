require 'test_helper'
require 'galaxy_resources_manager'

describe GalaxyResourcesManager do
  describe '#create_resource' do
    it 'updates resource_to_credit_map with input' do
      GalaxyResourcesManager.reset!
      GalaxyResourcesManager.create_resource('silver', 4, 50)
      GalaxyResourcesManager.resource_to_credit_map['silver'].must_equal 12.5
    end
  end

  describe '#calculate_resource_credit' do
    describe 'when resource is registered' do
      it 'returns credit value of input resource' do
        gold_unit_credit = 1000
        GalaxyResourcesManager.reset!
        GalaxyResourcesManager.create_resource('gold', 5, (gold_unit_credit * 5))
        GalaxyResourcesManager.calculate_resource_credit('gold', 10).must_equal(gold_unit_credit * 10)
      end
    end

    describe 'when resource is not registered' do
      it 'raises GalaxyResourceNotFound exception' do
        GalaxyResourcesManager.reset!
        -> { GalaxyResourcesManager.calculate_resource_credit('gold', 20) }.must_raise GuideExceptions::GalaxyResourceNotFound
      end
    end
  end

  describe '#reset!' do
    it 'resets the resource_to_credit_map' do
      GalaxyResourcesManager.create_resource('zinc', 100, 80)
      GalaxyResourcesManager.reset!
      GalaxyResourcesManager.resource_to_credit_map.size.must_equal 0
    end
  end
end
