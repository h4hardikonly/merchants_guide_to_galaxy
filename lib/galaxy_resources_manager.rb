require 'singleton'
require_relative 'guide_exceptions/galaxy_resource_not_found.rb'

class GalaxyResourcesManager
  include Singleton
  attr_reader :resource_to_credit_map

  def initialize
    @resource_to_credit_map = {} # stores the credit value of resource for one unit
  end

  def create_resource(resource_name, human_unit, credits)
    resource_to_credit_map[resource_name] = credits.fdiv human_unit
  end

  def calculate_resource_credit(resource_name, human_unit)
    raise GuideExceptions::GalaxyResourceNotFound.new(resource_name) unless resource_to_credit_map[resource_name]
    resource_to_credit_map[resource_name] * human_unit
  end

  def reset!
    @resource_to_credit_map = {}
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
