class Pawn < Piece
  attr_accessor :on_initial_square, :position, :facing, :color, :board

  def initialize(x,y, facing, color)
    *position = x, y
    super(position, facing, color)

    @board = Board.new
  end

  def move(steps)
    x,y = @position
    new_x,new_y = x,y

    case @facing
    when NORTH
      new_y += steps
    when SOUTH
      new_y -= steps
    when WEST
      new_x -= steps
    when EAST
      new_x += steps
    end

    from_square = nil
    to_square = nil
    puts "===== checking board_squares === #{@board.square_hash}"
    @board.square_hash.each do |_,v|
      if v.x == x && v.y == y
        from_square = v
        from_square.piece_on_square = self.class
      end

      if v.x == new_x && v.y == new_y
        to_square = v
      end
    end

    puts "checking from_square ==== #{from_square} to_square === #{to_square}"
    if from_square && to_square
      @board.place_piece(from_square, to_square)
      @position = to_square.x, to_square.y
    end
  end

  def left
    @facing = rotate90_degree()
  end

  def right
    @facing = rotate90_degree('right')
  end

  def report
    [@position, @facing, @color].flatten.join(',')
  end

  def rotate90_degree(direction='left')
    facings = FACINGS
    if @facing == NORTH
        facings << EAST
    end

    index_pos = facings.index(@facing)
    if direction == 'right'
      facings[index_pos + 1]
    else
      facings[index_pos - 1]
    end
  end
end