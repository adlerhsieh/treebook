require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end

  test "post new status after signin" do
    sign_in users(:adler)
    get :new
    assert_response :success
  end

  test "create without signin" do
    post :create, status: {content: "hello"} 
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create status" do
    sign_in users(:adler)
    assert_difference('Status.count') do
      post :create, status: { content: @status.content}
    end

    assert_redirected_to status_path(assigns(:status))
  end

  test "should show status" do
    get :show, id: @status
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:adler)
    get :edit, id: @status
    assert_response :success
   end

  test "get edit without signin" do
    get :edit, id: @status
    assert_response :redirect
   end

  test "update status without signin" do
    patch :update, id: @status, status: { content: @status.content}
    assert_redirected_to new_user_session_path
  end

  test "should update status" do
    sign_in users(:adler)
    patch :update, id: @status, status: { content: @status.content}
    assert_redirected_to status_path(assigns(:status))
  end

  test "should destroy status" do
    sign_in users(:adler)
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
    end

    assert_redirected_to statuses_path
  end
end
