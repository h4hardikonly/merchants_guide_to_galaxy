require_relative '../command_handler.rb'
require_relative '../galaxy_units_manager.rb'
require_relative '../output_handler.rb'

class CommandHandlers::AlienUnitQuery < CommandHandler
  PATTERN = /^how much is ((\w+ )+)\?$/ # Example: how much is pish tegj glob glob ?

  class << self
    def exec_command(command)
      galaxy_units = matched_data(command)
      human_unit = GalaxyUnitsManager.galaxy_units_to_human_unit(galaxy_units)
      OutputHandler.instance.print "#{galaxy_units} is #{human_unit}"
    end

    def matched_data(command)
      command =~ self::PATTERN
      $1
    end
  end
end
