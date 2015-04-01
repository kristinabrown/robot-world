ENV['ROBOT_MAKER_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'

class ModelTest < Minitest::Test 
  def teardown
    RobotMaker.delete_all
  end
end