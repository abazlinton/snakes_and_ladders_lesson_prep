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
    player3 = Player.new("Keith")
    @players = [player1, player2, player3]
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
    @game.run_next_turn
    assert_equal(@game.current_player, @players[1])
  end

  def test_player1_has_2nd_turn
    @game.do_current_player_turn(1)
    @game.do_current_player_turn(1)
    @game.do_current_player_turn(1)
    assert_equal(@game.current_player, @players[0])
  end

  def test_player3_can_play
    @game.do_current_player_turn(1)
    @game.do_current_player_turn(1)
    assert_equal(@game.current_player, @players[2])
  end

  def test_player_can_move
    @game.do_current_player_turn(2)
    assert_equal(2, @game.players[0].position)
    assert_equal(@players[1], @game.current_player)
  end

  def test_game_adjusts_for_jumps
    @game.board.add_jump(1, 2)
    @game.do_current_player_turn(1)
    assert_equal(3, @game.players[0].position)
    assert_equal(@players[1], @game.current_player)
  end

  def test_no_winner_at_start
    assert_nil(@game.winner)
  end

  def test_game_not_over_at_start
    assert_equal(false, @game.game_over?)
  end

  def test_game_can_be_won__hit_last_square
    @game.do_current_player_turn(19)
    assert_equal(true, @game.game_over?)
    assert_equal(@game.players[0], @game.winner)
  end

  def test_game_can_be_won__over_last_square
    @game.do_current_player_turn(20)
    assert_equal(true, @game.game_over?)
    assert_equal(@game.players[0], @game.winner)
  end

  def test_current_player_doesnt_change_on_game_over
    @game.do_current_player_turn(19)
    assert_equal(@game.players[0], @game.current_player)
  end

  

end