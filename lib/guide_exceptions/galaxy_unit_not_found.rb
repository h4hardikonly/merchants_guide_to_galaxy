require_relative '../guide_exception.rb'

class GuideExceptions::GalaxyUnitNotFound < GuideException
  attr_reader :galaxy_unit_name

  def initialize(galaxy_unit_name)
    @galaxy_unit_name = galaxy_unit_name
  end

  def friendly_message
    "No Galaxy unit found with name #{galaxy_unit_name}"
  end
end
