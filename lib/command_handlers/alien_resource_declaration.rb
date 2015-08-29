require_relative '../command_handler.rb'
require_relative '../galaxy_units_manager.rb'
require_relative '../galaxy_resources_manager.rb'

class CommandHandlers::AlienResourceDeclaration < CommandHandler
  PATTERN = /^([a-z ]+)([A-Z]\w+) is (\d+) Credits$/ # Example: glob glob Silver is 34 Credits

  class << self
    def exec_command(command)
      galaxy_units_str, resource_name, credits = matched_data(command)
      human_unit = GalaxyUnitsManager.galaxy_units_to_human_unit(galaxy_units_str)
      GalaxyResourcesManager.create_resource(resource_name, human_unit, credits.to_i)
    end

    def matched_data(command)
      command =~ self::PATTERN
      [$1, $2, $3]
    end
  end
end
