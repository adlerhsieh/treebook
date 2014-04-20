require 'test_helper'

class StatusTest < ActiveSupport::TestCase

	test "content should not be blank" do
		status = Status.new
		assert !status.save
		assert !status.errors[:content].empty?
	end

	test "content should be at least 2 characters long" do
		status = Status.new
		status.content = "1"
		assert !status.save
		assert !status.errors[:content].empty?
	end

	test "user needs an id" do
		status = Status.new
		status.content = "hello"
		assert !status.save
		assert !status.errors[:user_id].empty?
	end
end
