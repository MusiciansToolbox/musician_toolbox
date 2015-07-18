require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "has many clips" do
    user = User.create(password: "password", name: "name", email: "example7@email.com", zipcode: "12345")
    clip1 = Clip.create(instrument_id: 1, user_id: user.id)
    clip2 = Clip.create(instrument_id: 1, user_id: user.id)
    assert_equal 2, user.clips.count
  end

  # test "has many user searches" do
  #   user = User.create(password: "password", name: "name", email: "example7@email.com", zipcode: "12345")
  #   assert_difference 'UserSearch.count', 2 do
  #     UserSearch.create(searcher_id: user.id)
  #     UserSearch.create(searcher_id: user.id)
  #   end
  #   # assert_equal 2, user.user_searches.count
  # end

  test "name required" do
    user1 = User.new(password: "password", zipcode: "12345", email: "example1@email.com")
    user2 = User.new(password: "password", zipcode: "12345", email: "example2@email.com", name: "name")
    refute user1.save
    assert user2.save
  end

  test "unique email required with specific format" do
    user1 = User.new(password: "password", zipcode: "12345", name: "name")
    user2 = User.new(password: "password", zipcode: "12345", name: "name", email: "not an email(emails need a the 'at' symbol and a period)")
    user3 = User.new(password: "password", zipcode: "12345", name: "name", email: "example.email@com") # wrong format
    user4 = User.new(password: "password", zipcode: "12345", name: "name", email: "example.email.com") # wrong format
    user5 = User.new(password: "password", zipcode: "12345", name: "name", email: "example@email@com") # wrong format
    user6 = User.new(password: "password", zipcode: "12345", name: "name", email: "example@email.com")
    user7 = User.new(password: "password", zipcode: "12345", name: "name", email: "example@email.com") # no duplicate emails
    user8 = User.new(password: "password", zipcode: "12345", name: "name", email: "example2@email.com")
    refute user1.save
    refute user2.save
    refute user3.save
    refute user4.save
    refute user5.save
    assert user6.save
    refute user7.save
    assert user8.save
  end

  test "5 digit zipcode with optional extension" do
    user1 = User.new(password: "password", name: "name", email: "example1@email.com")
    user2 = User.new(password: "password", name: "name", email: "example2@email.com", zipcode: "NaN")
    user3 = User.new(password: "password", name: "name", email: "example3@email.com", zipcode: "1234")
    user4 = User.new(password: "password", name: "name", email: "example4@email.com", zipcode: "12345")
    user5 = User.new(password: "password", name: "name", email: "example5@email.com", zipcode: "123456")
    # user6 = User.new(password: "password", name: "name", email: "example6@email.com", zipcode: "12345-678")
    user7 = User.new(password: "password", name: "name", email: "example7@email.com", zipcode: "12345-6789")
    # user8 = User.new(password: "password", name: "name", email: "example8@email.com", zipcode: "12345-67890")
    refute user1.save
    refute user2.save
    refute user3.save
    assert user4.save
    refute user5.save
    # refute user6.save
    assert user7.save
    # refute user8.save
  end

end
