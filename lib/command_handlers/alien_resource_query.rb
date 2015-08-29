require_relative '../command_handler.rb'
require_relative '../galaxy_units_manager.rb'
require_relative '../galaxy_resources_manager.rb'
require_relative '../output_handler.rb'

class CommandHandlers::AlienResourceQuery < CommandHandler
  PATTERN = /^how many Credits is ([a-z ]+)([A-Z]\w+) \?$/ # Example: how many Credits is glob prok Iron ?

  class << self
    def exec_command(command)
      galaxy_units, resource_name = matched_data(command)
      human_unit = GalaxyUnitsManager.galaxy_units_to_human_unit(galaxy_units)
      credit = GalaxyResourcesManager.calculate_resource_credit(resource_name, human_unit)
      OutputHandler.instance.print("#{galaxy_units}#{resource_name} is %g Credits" % credit)
      credit
    end

    def matched_data(command)
      command =~ self::PATTERN
      [$1, $2]
    end
  end
end
