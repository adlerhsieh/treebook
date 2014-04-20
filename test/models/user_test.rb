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
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("should be in the right format.")
  end

  test "a user has a profile name in the right format" do
    user = User.new(first_name: "adler", last_name: "hsieh", email: "nkj20933@hotmail.com")
    user.password = user.password_confirmation = "1234asdf"
    user.profile_name = "hellothis"
    assert user.save
  end
end
