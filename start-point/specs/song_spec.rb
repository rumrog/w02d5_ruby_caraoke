require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../room")
require_relative("../guest")
require_relative("../song")

class SongTest < MiniTest::Test

	def setup
		@song1 = Song.new("The Rolling Stones - Paint It Black")
		@song2 = Song.new("Queen - Don't Stop Me Now")
		@song3 = Song.new("R.E.M. - Losing My Religion")
		@song4 = Song.new("Black Sabbath - Black Sabbath")
		@song5 = Song.new("Daft Punk - Harder, Better, Faster, Stronger")
	end

	def test_song_has_name()
		assert_equal("The Rolling Stones - Paint It Black", @song1.name())
	end

end
