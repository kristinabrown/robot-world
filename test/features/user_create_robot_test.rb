require_relative '../test_helper.rb'

class UserCreateRobotTest < FeatureTest
  def test_user_can_create_robot
    visit '/'
    
    click_link("New Robot")
    fill_in('robot[name]', with: "milli")
    click_button('Activate')
    
    assert_equal '/robots', current_path
    assert page.has_content?("milli")
  end
end