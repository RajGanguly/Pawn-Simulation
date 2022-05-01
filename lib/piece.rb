class Piece
  attr_accessor :color, :facing, :position

  def initialize(position, facing, color)
    @color = color
    @facing = facing
    @position = position
  end
end
