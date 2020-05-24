require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../room")
require_relative("../guest")
require_relative("../song")

class GuestTest < MiniTest::Test

	def setup
		@guest1 = Guest.new("Max", 20.00)
		@guest2 = Guest.new("Bob", 5.00)
	end

	def test_guest_name_and_wallet()
		assert_equal("Max", @guest1.name())
		assert_equal(20.00, @guest1.wallet())
	end
    
end