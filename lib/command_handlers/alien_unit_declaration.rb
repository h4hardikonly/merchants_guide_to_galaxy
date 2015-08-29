require_relative '../command_handler.rb'
require_relative '../galaxy_units_manager.rb'

class CommandHandlers::AlienUnitDeclaration < CommandHandler
  PATTERN = /^([a-z]+) is ([I|V|X|L|C|D|M])$/ # Example: glob is I

  class << self
    def exec_command(command)
      unit_name, roman_char = matched_data(command)
      GalaxyUnitsManager.create_unit(unit_name, roman_char)
    end

    def matched_data(command)
      command =~ self::PATTERN
      [$1, $2]
    end
  end
end
