require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
  	user = User.new
  	user.profile_name = users(:adler).profile_name
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should enter a profile name with the right format" do
  	user = User.new
  	user.profile_name = "has blank"
  	
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("profile should be in the right format.")
  end

end
