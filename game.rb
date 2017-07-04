require 'pry'

class Game

  attr_reader :players, :board, :current_player, :winner

  def initialize(players, board)
    @players = players
    @current_player_index = 0
    @board = board
    @current_player = @players[@current_player_index]
    @winner = nil
  end

  def run_next_turn
    @current_player_index += 1
    @current_player_index = 0 if @current_player_index > ( @players.count - 1 )
    @current_player = @players[@current_player_index]
  end

  def do_current_player_turn(spaces)
    @current_player.move(spaces)
    jump = @board.spaces[@current_player.position]
    @current_player.move(jump) if jump != nil 
    check_for_win
    run_next_turn unless game_over?
  end

  def check_for_win
    @winner = @current_player if @current_player.position >= ( @board.spaces.count - 1 )
  end

  def game_over?
    @winner != nil ? true : false
  end


end