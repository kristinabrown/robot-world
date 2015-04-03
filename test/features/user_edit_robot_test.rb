require_relative '../test_helper.rb'

class UserEditRobotTest < FeatureTest
  def test_a_user_can_edit_a_robot
    RobotMaker.create({name: "milli"})
    
    visit '/robots'
    assert page.has_content?("milli")
    click_link_or_button("Edit")
    fill_in('robot[name]',with: "milli-moo")
    click_link_or_button("submit-changes")
    
    assert page.has_content?("milli-moo")
  end
end