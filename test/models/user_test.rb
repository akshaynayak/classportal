require 'test_helper'


class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @User=User.new(name:"Demo user", email: "demo@ncsu.edu", password: "123456")
  end

  test "email should be present" do

  end


end

