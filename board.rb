class Board
  attr_reader :board

  def initialize
    default_board
    make_board
  end

  def make_board
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def default_board
    board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    display_board(board)
  end

  def update_board(position, player)
    board[position] = player.marker
    display_board(board)
    default_board
  end

  def display_board(board)
    puts ''
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts '--- --- ---'
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts '--- --- ---'
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
    puts ''
  end
end
