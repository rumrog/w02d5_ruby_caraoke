require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../room")
require_relative("../guest")
require_relative("../song")

class GuestTest < MiniTest::Test

	def setup
		@guest1 = Guest.new("Max", 20.00, "The Rolling Stones - Paint It Black")
		@guest2 = Guest.new("Freddy", 5.00, "Queen - Don't Stop Me Now")
		@guest3 = Guest.new("Jil", 10.00, "R.E.M. - Losing My Religion")
		@guest4 = Guest.new("Andrew", 50.00, "Black Sabbath - Black Sabbath")
		@guest5 = Guest.new("Freddy", 25.00, "Daft Punk - Harder, Better, Faster, Stronger")
	end

	def test_guest_has_name_wallet_and_fav_song()
		assert_equal("Max", @guest1.name())
		assert_equal(20.00, @guest1.wallet())
		assert_equal("The Rolling Stones - Paint It Black", @guest1.fav_song)
	end
		
end