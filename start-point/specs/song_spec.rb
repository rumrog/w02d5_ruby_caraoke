require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../room")
require_relative("../guest")
require_relative("../song")

class SongTest < MiniTest::Test

	def setup
		@song1 = Song.new("Queen - We Will Rock You")
		@song2 = Song.new("Queen - Don't Stop Me Now")
		@song3 = Song.new("Queen - Another One Bites the Dust")
	end

	def test_song_name()
		assert_equal("Queen - We Will Rock You", @song1.name())
	end

end
