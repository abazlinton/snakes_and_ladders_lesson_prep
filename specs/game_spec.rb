require 'minitest/autorun'
require '../game'
require '../player'
require '../board'
require 'minitest/reporters'
Minitest::Reporters.use!( Minitest::Reporters::SpecReporter.new )

class GameTest < MiniTest::Test 

  def setup
    player1 = Player.new("Alex")
    player2 = Player.new("John")
    @players = [player1, player2]
    @board = Board.new(20)
    @game = Game.new(@players, @board)
  end

  def test_game_has_players
    assert_equal("Alex", @game.players[0].name)
  end

  def test_game_has_board
    assert_equal(20, @game.board.spaces.count)
  end






  

end