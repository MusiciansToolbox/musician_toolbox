require 'test_helper'
require 'minitest/pride'

class ClipTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "must have user id" do
    clip1 = Clip.new(instrument_id: 1)
    clip2 = Clip.new(instrument_id: 1, user_id: "seven")
    clip3 = Clip.new(instrument_id: 1, user_id: 1)

    refute clip1.save
    refute clip2.save
    assert clip3.save
  end

  test "must have instrument id" do
    clip1 = Clip.new(user_id: 1)
    clip2 = Clip.new(user_id: 1, instrument_id: "g")
    clip3 = Clip.new(user_id: 1, instrument_id: 1)

    refute clip1.save
    refute clip2.save
    assert clip3.save
  end
end
