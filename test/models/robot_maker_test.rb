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
    last_robot = RobotMaker.all.last
    robot = RobotMaker.find(last_robot.id)
    
    assert_equal last_robot.id, robot.id
    assert_equal "milli4", robot.name
  end
  
  def test_it_can_return_all_robots
    create_robots(7)
    robots = RobotMaker.all
    
    assert_equal 7, robots.count
    assert_equal Robot, robots[5].class
  end
  
  def test_it_can_update_a_robot
    create_robots(5)
    last_robot = RobotMaker.all.last
    robot = RobotMaker.find(last_robot.id)
    assert_equal "milli4", robot.name
    
    RobotMaker.update(robot.id, {name: "ryan", state: "OR"})
    robot_new = RobotMaker.find(robot.id)
    
    assert_equal "ryan", robot_new.name
    assert_equal "OR", robot_new.state
  end
  
  def test_it_can_destroy_a_robot
    create_robots(5)
    assert_equal 5, RobotMaker.all.count
    last_robot = RobotMaker.all.last
  
    RobotMaker.destroy(last_robot.id)
    
    assert_equal 4, RobotMaker.all.count
  end
end