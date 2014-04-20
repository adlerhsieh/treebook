require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "profile page rendered successfully" do
    get :show, id: users(:adler).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "no such profile" do
    get :show, id: "none"
    assert_response :not_found
  end

  test "variables are assigned successfully from controllers into views" do
  	get :show, id: users(:adler).profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:statuses)
  end

  test "user profile page displays statuses belongs to only one user" do 
  	get :show, id: users(:adler).profile_name
  	assigns(:statuses).each do |status|
  		assert_equal users(:adler), status.user
  	end
  end

end
