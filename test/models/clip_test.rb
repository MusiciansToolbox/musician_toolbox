require 'test_helper'
require 'minitest/pride'

class ClipTest < ActiveSupport::TestCase
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

  test "can have jam circle id" do
    jam = JamCircle.create( user_id: 1, open: true, public: true, title: "not empty" )

    clip1 = Clip.new(user_id: 1, instrument_id: 1)
    clip2 = Clip.new(user_id: 1, instrument_id: 1)
    clip3 = Clip.new(user_id: 1, instrument_id: 1, jam_circle_id: 1)

    clip2.jam_circle = jam

    assert clip1.save
    assert clip2.save
    assert clip3.save

    assert_nil clip1.jam_circle
    assert_equal jam.id, clip2.jam_circle_id
    assert_equal 1, clip3.jam_circle_id
  end

  test "can have previous clip id" do
    clip1 = Clip.new(user_id: 1, instrument_id: 1)
    assert clip1.save

    clip2 = Clip.new(user_id: 1, instrument_id: 1, previous_clip_id: clip1.id)
    assert clip2.save

    assert_equal clip1.id, clip2.previous_clip_id
  end
end
