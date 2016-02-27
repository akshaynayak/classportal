require 'test_helper'


class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @User = User.new(name: "Demo user", email: "demo@ncsu.edu", password: "password123")
  end

  test "email should not be blank" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "should be valid" do
    assert @User.valid?, "User details not saved"
  end

  test "name should not be blank" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "email address should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should not be blank (nonblank)" do
    @user.password =  " "
    assert_not @user.valid?
  end

end

