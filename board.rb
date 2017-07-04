class Board

  attr_reader :spaces

  def initialize(spaces)
    @spaces = Array.new(20)
  end

  def add_jump(space, jump_delta)
    if ( space > 0 && space != @spaces.count - 1 )
      @spaces[space] = jump_delta 
    end
  end

end