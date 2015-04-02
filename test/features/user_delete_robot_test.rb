require_relative '../test_helper.rb'

class UserEditRobotTest < FeatureTest
  def test_a_user_can_edit_a_robot
    RobotMaker.create({name: "milli"})
    
    visit '/robots'
    assert page.has_content?("milli")
    click_link_or_button("Deactivate")
    
    refute page.has_content?("milli")
  end
end