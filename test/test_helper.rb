require 'bundler'
Bundler.require(:default, :test)

$LOAD_PATH << File.join(File.dirname(__FILE__), '/../lib')
$LOAD_PATH << File.join(File.dirname(__FILE__), '/../lib/command_handlers')

require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
