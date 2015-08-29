# require all file with '.rb' extension that resides inside directory 'lib/command_handlers'
Dir.glob(File.join(File.dirname(__FILE__), '{lib}', 'command_handlers', '**', '*.rb' ), &method(:require) )
require 'optparse' # To parse command line args

class MerchantsGuide
  attr_reader :input_file_path

  # loop over the CommandHandlers module and list all command handlers classes
  # So when we introduce any new command class we don't need to change this file
  COMMAND_HANDLERS_ARR = CommandHandlers.constants.inject([]) do |handlers, const_name|
    const = CommandHandlers.const_get(const_name)
    handlers << const if const.is_a?(Class)
    handlers
  end
  DEFAULT_INPUT_FILE_PATH = File.expand_path('default_input.txt', 'data')

  def initialize
    parse_command_line_args
    @input_file_path ||= DEFAULT_INPUT_FILE_PATH
  end

  def start
    unless File.file?(input_file_path)
      puts "No such file found #{input_file_path}"
      exit
    end

    File.foreach(input_file_path) do |command|
      command.strip!
      next if command.empty?
      command_processed = COMMAND_HANDLERS_ARR.any? { |command_handler| command_handler.try_exec command }
      puts 'I have no idea what you are talking about' unless command_processed
    end
  end

  private

  def parse_command_line_args
    OptionParser.new do |opts|
      opts.banner = "Usage: ruby merchants_guide.rb [options]"
      opts.on('-f', '--filepath=path', 'Absolute file path of input file') { |file_path| @input_file_path = file_path }
      opts.on("-h", "--help", "Show this help") { puts opts; exit }
    end.parse!
  end
end
