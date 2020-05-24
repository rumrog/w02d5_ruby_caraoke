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
		@room = Room.new("E40", [@guest1, @guest2], 2, [@song1, @song2], 100.00, 10.00)
	end
		
	def test_room_has_name_capactity_till_and_fee()
		assert_equal("E40", @room.name())
		assert_equal(2, @room.capacity())
		assert_equal(100.00, @room.till())
		assert_equal(10.00, @room.fee())
	end

	def test_room_has_guests()
		assert_equal(2, @room.guests().size())
	end


	def test_room_has_playlist()
		assert_equal(2, @room.playlist().size())
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

end