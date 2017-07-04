require 'minitest/autorun'
require '../player'
require( 'minitest/reporters' )
Minitest::Reporters.use!( Minitest::Reporters::SpecReporter.new )

class PlayerTest < MiniTest::Test 

  def setup
    @player = Player.new("Alex")
  end

  def test_player_has_name
    assert_equal("Alex", @player.name)
  end

  def test_player_position_starts_at_zero
    assert_equal(0, @player.position)
  end

  def test_player_can_move
    @player.move(2)
    assert_equal(2, @player.position)
  end


end