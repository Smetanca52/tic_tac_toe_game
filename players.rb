class Player
  require './board.rb'

  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def move(board)
    position = get_move(board)
    board.update_board(position.to_i - 1, self)
  end

  def get_move(board)
    position = gets.chomp
    i = 0
    until i < 9 &&
       (board.board[position.to_i - 1] != 'X' && board.board[position.to_i - 1] != 'O')
       puts 'Please type in an integer that represents an open position'
       position = gets.chomp
     end
     position
   end
end
