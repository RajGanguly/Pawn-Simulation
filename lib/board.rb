class Board
  attr_accessor :square_hash

  Letters = ("a".."h").to_a.freeze
  Numbers = (0..7).to_a.freeze
  Letters_hash = {0=>"a", 1=>"b", 2=>"c", 3=>"d", 4=>"e", 5=>"f", 6=>"g", 7=>"h"}.freeze

  def initialize
    @square_hash = Hash.new
    arrange_board
  end

  def arrange_board
    Letters.each_with_index do |letter,index|
      Numbers.each do |n|
        @square_hash["#{letter}#{n}"] = Square.new(index,n,"#{letter}#{n}")
      end
    end
  end

  def place_piece(from_square, to_square)
    to_square.piece_on_square = from_square&.piece_on_square
    from_square.piece_on_square = nil
  end
end