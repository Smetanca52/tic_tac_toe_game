class Game
  require './players.rb'
  require './board.rb'
  
  WIN_COMB = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
              [0, 3, 6], [1, 4, 7], [2, 5, 8],
              [0, 4, 8], [2, 4, 6]]

  def initialize
    puts 'Welcome to Tic Tac Toe game!'
    @game_over = false
    @turn = 0
    @player1 = Player.new('X')
    @player2 = Player.new('O')
    create_board
    play_game
  end

  def create_board
    @board = Board.new
  end

  def play_game
    puts 'Player X first to move:'
    until @game_over
      @player1.move(@board)
      check_status(@player1)
      @player2.move(@board)
      check_status(@player2)
    end
  end

  def check_status(player)
    winner = WIN_COMB.any? do |combo|
      combo.all? do |index|
        @board.board[index] == player.marker
      end
    end

    if winner
      end_game(player)
    else
      @turn += 1
      end_game('tie') if @turn >= 9
    end
  end

  def end_game(player)
    if player == 'tie'
      puts "It's a tie."
    else
      puts "#{player.marker} won!"
    end
    @game_over = true
    reset_game
  end

  def reset_game
    puts 'Do you want to play a new game?[y\n]'
    response = gets.chomp
    if response == 'y'
      Game.new
    else
      puts 'The game is over'
      exit
    end
  end
end

Game.new
