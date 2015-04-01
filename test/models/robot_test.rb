require_relative '../test_helper.rb'

class RobotTest < ModelTest
  
  def test_it_assigns_attributes_correctly
    robot = Robot.new({ "id"         => 1,
                        "name"       => "milli", 
                        "avatar"     => "picture",
                        "city"       => "Denver",
                        "state"      => "CO",
                        "birthdate"  => "yesterday",
                        "date_hired" =>  "today",
                        "department" => "sales" })
    assert_equal "milli", robot.name
    assert_equal "Denver", robot.city
    assert_equal 1, robot.id
  end
  
end