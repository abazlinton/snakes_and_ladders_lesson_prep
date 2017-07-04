require 'pry'

class Game

  attr_reader :players, :board, :current_player, :winner

  def initialize(players, board)
    @players = players
    @board = board
    @current_player = @players[0]
    @winner = nil
  end

  def run_next_turn
    @current_player = @players.rotate[0]
  end

  def do_current_player_turn(spaces)
    @current_player.move(spaces)
    jump = @board.spaces[@current_player.position]
    @current_player.move(jump) if jump != nil 
    check_for_win
    run_next_turn unless game_over?
  end

  def check_for_win
    @winner = @current_player if @current_player.position == ( @board.spaces.count - 1 )
  end

  def game_over?
    @winner != nil ? true : false
  end

end