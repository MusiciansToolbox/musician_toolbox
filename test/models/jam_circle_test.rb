require 'test_helper'

class JamCircleTest < ActiveSupport::TestCase

  test "requires user id" do
    one = JamCircle.new( open: true, public: true, title: "not empty" )
    two = JamCircle.new( open: true, public: true, title: "not empty", user_id: 1 )
    refute one.save
    assert two.save
  end

  test "requires title" do
    jam1 = JamCircle.new( user_id: 1, open: true, public: true )
    jam2 = JamCircle.new( user_id: 1, open: true, public: true, title: "" )
    jam3 = JamCircle.new( user_id: 1, open: true, public: true, title: "not empty" )

    refute jam1.save
    refute jam2.save
    assert jam3.save
  end

  # Almost useless test. Simply tests if description attribute exists and can be saved. lol.
  test "description optional" do
    jam1 = JamCircle.new( user_id: 1, open: true, public: true, title: "not empty" )
    jam2 = JamCircle.new( user_id: 1, open: true, public: true, title: "not empty", description: "description" )
    assert jam1.save
    assert jam2.save
  end

  test "either open or closed" do
    one = JamCircle.new( user_id: 1, public: true, title: "not empty" )
    two = JamCircle.new( user_id: 1, public: true, title: "not empty", open: true )
    three = JamCircle.new( user_id: 1, public: true, title: "not empty", open: false )
    # four = JamCircle.new( user_id: 1, public: true, title: "not empty", open: "hiiiiiii" )

    refute one.save
    assert two.save
    assert three.save

    # refute four.save
    # # this does not need to be tested. assume it works. If
    # # you uncomment this, the tests WILL thow a huge DEPRACATION ERROR rather
    # # than just a regular old failing of this test.

  end

  test "either private or public" do
    one = JamCircle.new( user_id: 1, open: true, title: "not empty" )
    two = JamCircle.new( user_id: 1, open: true, title: "not empty", public: true )
    three = JamCircle.new( user_id: 1, open: true, title: "not empty", public: false )

    refute one.save
    assert two.save
    assert three.save
  end

  test "has many clips" do # nested/mass assignment thru jams ??
    jam = JamCircle.create( user_id: 1, open: true, public: true, title: "not empty" )

    jam_clip1 = jam.clips.new( user_id: 1, instrument_id: 1 )
    jam_clip2 = Clip.new( user_id: 1, instrument_id: 1, jam_circle_id: jam.id )
    not_jam_clip = Clip.new( user_id: 1, instrument_id: 1 )

    assert_difference "jam.clips.count" do
      jam.save # jam now has one clip
    end

    assert jam_clip2.save # nested attribute save. Jam now has two clips

    # clip does not need to be part of a jam session
    assert not_jam_clip.save

    assert_equal 2, jam.clips.count

    array_of_ids = [jam_clip1.id, jam_clip2.id]

    assert_equal array_of_ids, jam.clips.map {|x| x.id }
  end


end
