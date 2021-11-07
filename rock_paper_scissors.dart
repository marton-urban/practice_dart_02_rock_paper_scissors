import 'dart:io';
import 'dart:math';

enum Move { rock, paper, scissors, invalid }
final rng = Random();
var playerMove;

void main() {
  while (true) {
    stdout.write('Rock, paper or scissors? (r/p/s) ');
    final input = stdin.readLineSync();

    switch (input) {
      case 'r':
        playerMove = Move.rock;
        break;
      case 'p':
        playerMove = Move.paper;
        break;
      case 's':
        playerMove = Move.scissors;
        break;
      case 'q':
        exit(0);
      default:
        playerMove = Move.invalid;
        break;
    }

    if (playerMove != Move.invalid) {
      final random = rng.nextInt(3);
      final aiMove = Move.values[random];
      print('You played: $playerMove');
      print('AI played: $aiMove');
      if (playerMove == aiMove) {
        print("It's a draw");
      } else if (playerMove == Move.rock && aiMove == Move.scissors ||
          playerMove == Move.paper && aiMove == Move.rock ||
          playerMove == Move.scissors && aiMove == Move.paper) {
        print("You win");
      } else {
        print("You lose");
      }
    } else {
      print('Invalid move');
    }
  }
}
