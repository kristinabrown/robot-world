require_relative '../test_helper.rb'

class UserFrontPageTest < FeatureTest
  
  def test_user_sees_welcome_message
    visit '/'
    within("#main-header") do
      assert page.has_content?("Welcome to Robot World!")
    end
  end
end