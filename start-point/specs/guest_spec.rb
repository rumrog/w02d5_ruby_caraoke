require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../room")
require_relative("../guest")
require_relative("../song")

class GuestTest < MiniTest::Test

	def setup
		@guest1 = Guest.new("Max", 20.00, "Queen - We Will Rock You")
		@guest2 = Guest.new("Bob", 5.00, "Queen - Don't Stop Me Now")
		@guest3 = Guest.new("Jil", 10.00, "Queen - Another One Bites the Dust")
	end

	def test_guest_name_and_wallet_and_fav_song()
		assert_equal("Max", @guest1.name())
		assert_equal(20.00, @guest1.wallet())
		assert_equal("Queen - We Will Rock You", @guest1.fav_song)
	end
    
end