require 'minitest/autorun'
require '../board'
require( 'minitest/reporters' )
Minitest::Reporters.use!( Minitest::Reporters::SpecReporter.new )

class BoardTest < MiniTest::Test 

  def setup
    @board = Board.new(20)
  end

  def test_board_has_spaces
    assert_equal(20, @board.spaces.count)
  end

  def test_board_can_contain_snakes_and_ladders
    @board.add_jump(3, -2)
    assert_equal(-2, @board.spaces[3])
  end

  def test_cannot_add_snake_or_ladder_at__0
    @board.add_jump(0, 5)
    assert_nil(@board.spaces[0])
  end

  def test_cannot_add_snake_or_ladder_at__end
    @board.add_jump(19, 10)
    assert_nil(@board.spaces[19])
  end

end