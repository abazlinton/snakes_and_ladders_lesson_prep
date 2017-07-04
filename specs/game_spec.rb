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

  def test_player1_starts
    assert_equal(@game.current_player, @players[0])
  end

  def test_player2_can_play
    @game.next_turn
    assert_equal(@game.current_player, @players[1])
  end

  def test_player_can_move
    @game.do_current_player_turn(2)
    assert_equal(2, @game.players[0].position)
    assert_equal(@players[1], @game.current_player)
  end





  

end