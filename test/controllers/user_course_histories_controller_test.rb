require 'test_helper'


class UserCourseHistoriesControllerTest < ActionController::TestCase
  setup do
    @user_course_history = user_course_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_course_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_course_history" do
    assert_difference('UserCourseHistory.count') do
      post :create, user_course_history: {  }
    end

    assert_redirected_to user_course_history_path(assigns(:user_course_history))
  end

  test "should show user_course_history" do
    get :show, id: @user_course_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_course_history
    assert_response :success
  end

  test "should update user_course_history" do
    patch :update, id: @user_course_history, user_course_history: {  }
    assert_redirected_to user_course_history_path(assigns(:user_course_history))
  end

  test "should destroy user_course_history" do
    assert_difference('UserCourseHistory.count', -1) do
      delete :destroy, id: @user_course_history
    end

    assert_redirected_to user_course_histories_path
  end
end

