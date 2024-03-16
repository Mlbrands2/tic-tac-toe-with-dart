void main() {
  // Game board representation (1-9)
  List<String> board = List.generate(9, (_) => ' ');

  // Current player
  String currentPlayer = 'X';

  void printBoard() {
    print('     |     |');
    print('  ${board[0]}  |  ${board[1]}  |  ${board[2]}  ');
    print('     |     |');
    print('-------|-------|-------');
    print('     |     |');
    print('  ${board[3]}  |  ${board[4]}  |  ${board[5]}  ');
    print('     |     |');
    print('-------|-------|-------');
    print('     |     |');
    print('  ${board[6]}  |  ${board[7]}  |  ${board[8]}  ');
    print('     |     |');
  }

  bool checkWinner(String player) {
    // Check rows
    for (int i = 0; i < 3; i++) {
      if (board[i * 3] == player &&
          board[i * 3 + 1] == player &&
          board[i * 3 + 2] == player) {
        return true;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (board[i] == player && board[i + 3] == player && board[i + 6] == player) {
        return true;
      }
    }

    // Check diagonals
    if (board[0] == player && board[4] == player && board[8] == player) {
      return true;
    }
    if (board[2] == player && board[4] == player && board[6] == player) {
      return true;
    }

    return false;
  }

  bool isBoardFull() {
    return !board.contains(' ');
  }

  void takeTurn() {
    print('Player $currentPlayer, enter your move (1-9):');
    String moveStr = stdin.readLineSync(encoding: utf8)!;
    int move = int.tryParse(moveStr) ?? 0;

    if (move < 1 || move > 9 || board[move - 1] != ' ') {
      print('Invalid move. Please try again.');
      takeTurn();
      return;
    }

    board[move - 1] = currentPlayer;
  }

  while (true) {
    printBoard();

    takeTurn();

    if (checkWinner(currentPlayer)) {
      printBoard();
      print('Player $currentPlayer wins!');
      break;
    }

    if (isBoardFull()) {
      printBoard();
      print('It\'s a tie!');
      break;
    }

    currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
  }
}
