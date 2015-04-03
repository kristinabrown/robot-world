require_relative '../test_helper.rb'

class UserCreateRobotTest < FeatureTest
  def test_user_can_create_robot
    skip
    visit '/'
    
    click_link_or_button("New Robot")
    fill_in('robot[name]', with: "milli")
    click_button('Activate')
    
    assert_equal '/robots', current_path
    assert page.has_content?("milli")
  end
end