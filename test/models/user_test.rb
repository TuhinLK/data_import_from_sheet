require "test_helper"

class UserTest < ActiveSupport::TestCase
  fixtures :users

  test "should be valid" do
    user = users(:valid_user)
    assert user.valid?
  end

  test "should require a first name" do
    user = User.new(last_name: 'Doe', email_id: 'user@example.com')
    assert_not user.valid?
  end

  test "should require a unique email" do
    existing_user = users(:valid_user)
    user = User.new(first_name: 'Someone', last_name: 'User', email_id: existing_user.email_id)
    assert_not user.valid?
  end


end
