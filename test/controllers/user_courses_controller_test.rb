require 'test_helper'


class UserCoursesControllerTest < ActionController::TestCase
  setup do
    @user_course = user_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_course" do
    assert_difference('UserCourse.count') do
      post :create, user_course: { grade: @user_course.grade, has_requested_enrollment: @user_course.has_requested_enrollment, is_enrolled: @user_course.is_enrolled, is_teaching: @user_course.is_teaching }
    end

    assert_redirected_to user_course_path(assigns(:user_course))
  end

  test "should show user_course" do
    get :show, id: @user_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_course
    assert_response :success
  end

  test "should update user_course" do
    patch :update, id: @user_course, user_course: { grade: @user_course.grade, has_requested_enrollment: @user_course.has_requested_enrollment, is_enrolled: @user_course.is_enrolled, is_teaching: @user_course.is_teaching }
    assert_redirected_to user_course_path(assigns(:user_course))
  end

  test "should destroy user_course" do
    assert_difference('UserCourse.count', -1) do
      delete :destroy, id: @user_course
    end

    assert_redirected_to user_courses_path
  end
end

