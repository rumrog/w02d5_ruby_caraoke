require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../room")
require_relative("../guest")
require_relative("../song")

class RoomTest < MiniTest::Test

	def setup
		# Guests List
		@guest1 = Guest.new("Max", 20.00)
		@guest2 = Guest.new("Bob", 5.00)
		# Playlist
		@song1 = Song.new("Queen - We Will Rock You")
		@song2 = Song.new("Queen - Don't Stop Me Now")
		@song3 = Song.new("Queen - Another One Bites the Dust")
		# Rooms List
		@room = Room.new("E40", [@guest1, @guest2], [@song1, @song2], 100, 10.00)
	end
		
	def test_room_name()
		assert_equal("E40", @room.name())
	end

end