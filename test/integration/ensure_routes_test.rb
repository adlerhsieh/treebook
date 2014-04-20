require 'test_helper'

class EnsureRoutesTest < ActionDispatch::IntegrationTest

	test "get 'registration' routes to registration page" do
		get '/registration'
		assert_response :success
	end

	test "get 'signin' routes to signin page" do
		get '/signin'
		assert_response :success
	end

	test "get 'signout' routes to signout page" do
		get '/signout'
		assert_response :redirect
		assert_redirected_to '/'
	end
end
