require_relative 'output_handler.rb'
require_relative 'guide_exception.rb'

class CommandHandler
  class << self
    def try_exec(command)
      begin
        return false unless command =~ self::PATTERN
        exec_command(command)
        return true
      rescue GuideException => exception
        OutputHandler.instance.print(exception.friendly_message)
      end
    end
  end
end

module CommandHandlers
end
