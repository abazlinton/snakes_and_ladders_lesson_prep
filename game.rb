
class Game

  attr_reader :players, :board, :current_player

  def initialize(players, board)
    @players = players
    @board = board
    @current_player = @players[0]
  end

  def next_turn
    @current_player = @players.rotate[0]
  end

  def do_current_player_turn(spaces)
    @current_player.move(spaces)
    self.next_turn
  end

end