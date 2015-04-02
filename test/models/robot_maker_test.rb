require_relative '../test_helper.rb'

class RobotMakerTest < Minitest::Test
  def create_robots(num)
    num.times do |x|
      RobotMaker.create({ name: "milli#{x}" }) 
    end
  end
  
  def test_it_creates_a_robot
    create_robots(1)
    robots = RobotMaker.all
  
    assert_equal 1, robots.count
    assert_equal Robot, robots[0].class
  end
  
  def test_it_can_find_a_robot
    create_robots(5)
    robot = RobotMaker.find(4)
    
    assert_equal 4, robot.id
    assert_equal "milli3", robot.name
  end
  
  def test_it_can_return_all_robots
    create_robots(7)
    robots = RobotMaker.all
    
    assert_equal 7, robots.count
    assert_equal Robot, robots[5].class
  end
  
  def test_it_can_update_a_robot
    create_robots(5)
    robot = RobotMaker.find(4)
    assert_equal "milli3", robot.name
    
    RobotMaker.update(4, {name: "ryan", state: "OR"})
    robot_new = RobotMaker.find(4)
    
    assert_equal "ryan", robot_new.name
    assert_equal "OR", robot_new.state
  end
  
  def test_it_can_destroy_a_robot
    create_robots(5)
    assert_equal 5, RobotMaker.all.count
    
    RobotMaker.destroy(3)
    
    assert_equal 4, RobotMaker.all.count
  end
end