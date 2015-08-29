require_relative '../guide_exception.rb'

class GuideExceptions::GalaxyResourceNotFound < GuideException
  attr_reader :galaxy_resource_name

  def initialize(galaxy_resource_name)
    @galaxy_resource_name = galaxy_resource_name
  end

  def friendly_message
    "No Galaxy resource found with name #{galaxy_resource_name}"
  end
end
