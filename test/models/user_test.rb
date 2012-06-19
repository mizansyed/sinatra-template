require 'minitest/autorun'
require_relative '../test_helper'

describe User do
  before do
    @user = User.new
  end

  describe "User functionality" do
    it "respond with hi" do
      assert_equal "hi", @user.say_hi
    end
  end
end

