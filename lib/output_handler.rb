require 'singleton'

class OutputHandler
  include Singleton

  def print(output)
    puts output
    output
  end
end
