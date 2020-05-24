require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../room")
require_relative("../guest")
require_relative("../song")

class RoomTest < MiniTest::Test

	def setup
		# Playlist
		@song1 = Song.new("The Rolling Stones - Paint It Black")
		@song2 = Song.new("Queen - Don't Stop Me Now")
		@song3 = Song.new("R.E.M. - Losing My Religion")
		@song4 = Song.new("Black Sabbath - Black Sabbath")
		@song5 = Song.new("Daft Punk - Harder, Better, Faster, Stronger")
		# Guests List
		@guest1 = Guest.new("Max", 20.00, @song1)
		@guest2 = Guest.new("Freddy", 5.00, @song2)
		@guest3 = Guest.new("Jil", 10.00, @song3)
		@guest4 = Guest.new("Andrew", 50.00, @song4)
		@guest5 = Guest.new("Freddy", 25.00, @song5)
		# Rooms List
		@room = Room.new("E40", [], 2, [], 100.00, 10.00)
	end
		
	def test_room_has_name_capactity_till_and_fee()
		assert_equal("E40", @room.name())
		assert_equal(2, @room.capacity())
		assert_equal(100.00, @room.till())
		assert_equal(10.00, @room.fee())
	end

	def test_room_has_guests()
		assert_equal(0, @room.guests().size())
	end


	def test_room_has_playlist()
		assert_equal(0, @room.playlist().size())
	end

	def test_guest_can_afford_fee__sufficient_funds()
		assert_equal(true, @room.guest_can_afford_fee(@guest1, @room))
	end

	def test_guest_can_afford_fee__insufficient_funds()
		assert_equal(false, @room.guest_can_afford_fee(@guest2, @room))
	end

	def test_guest_can_afford_fee__exact_funds()
		assert_equal(true, @room.guest_can_afford_fee(@guest3, @room))
	end

	def test_room_has_room()
		assert_equal(true, @room.room_has_room(@room))
	end

	def test_remove_guest_cash()
		assert_equal(10.00, @room.remove_guest_cash(@guest1, @room))
	end
	
	def test_add_till_cash()
		assert_equal(110.00, @room.add_till_cash(@room))
	end

	def test_add_guest()
		@room.add_guest(@guest1)
		assert_equal(1, @room.guests().size())
  end

	def test_add_song()
		@room.add_song(@song1)
		assert_equal(1, @room.playlist().size())
  end

	def test_check_in()
		@room.check_in(@guest1, @room)
		assert_equal(true, @room.room_has_room(@room))
		assert_equal(10.00, @room.remove_guest_cash(@guest1, @room))
		assert_equal(110.00, @room.add_till_cash(@room))
		assert_equal(1, @room.guests().size())
	end
	
	def test_check_out()
		@room.check_out(@room)
		assert_equal(0, @room.guests().size())
	end
	
	def test_find_fav_song()
		assert_equal("Whoo!", @room.find_fav_song(@guest1))
	end
	
end