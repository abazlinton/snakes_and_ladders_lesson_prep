class Game

  attr_reader :players, :board

  def initialize(players, board)
    @players = players
    @board = board
  end

end