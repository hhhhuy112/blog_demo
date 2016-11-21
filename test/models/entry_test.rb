require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @entry = Micropost.new(title: "Lorem ipsum",  content: "acb", user_id: @user.id)
  end

  test "should be valid" do
    assert @entry.valid?
  end

  test "user id should be present" do
    @entry.user_id = nil
    assert_not @entry.valid?
  end

  test "body should be present" do
    @entry.body = "   "
    assert_not @micropost.valid?
  end

 
end
