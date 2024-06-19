import 'package:firstly/home.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  final String character;
  const Game({super.key, required this.character});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  late String playerOne;
  late String playerTwo;
  String winner = "";
  String message = "";
  bool playerOnePlaying = true;
  bool playerTwoPlaying = false;

  var board = [" ", " ", " ", " ", " ", " ", " ", " ", " "];
  @override
  void initState() {
    super.initState();
    if (widget.character == "X") {
      playerOne = "X";
      playerTwo = "O";
    } else {
      playerOne = "O";
      playerTwo = "X";
    }
  }

  void play(int index) {
    if (board[index] == "X" || board[index] == "O") {
      setState(() {
        message = "Box is occupied";
      });
    } else if (playerOnePlaying == true) {
      setState(() {
        board[index] = playerOne;
        playerOnePlaying = false;
        playerTwoPlaying = true;
        checkForDraw();
      });
    } else if (playerTwoPlaying == true) {
      setState(() {
        board[index] = playerTwo;
        playerTwoPlaying = false;
        playerOnePlaying = true;
        checkForDraw();
      });
    }
  }

  void newGame() {
    setState(() {
      board = [" ", " ", " ", " ", " ", " ", " ", " ", " "];
      playerOnePlaying = true;
      playerTwoPlaying = false;
      message = "";
      winner = "";
    });
  }

  void checkForPlayerOneWin() {
    // horizontal win
    if (board[0] == playerOne &&
            board[1] == playerOne &&
            board[2] == playerOne ||
        board[3] == playerOne &&
            board[4] == playerOne &&
            board[5] == playerOne ||
        board[6] == playerOne &&
            board[7] == playerOne &&
            board[8] == playerOne) {
      setState(() {
        winner = "Player One";
        message = "$winner is the winner";
      });
    }
    //diagonl win
    else if (board[0] == playerOne &&
            board[4] == playerOne &&
            board[8] == playerOne ||
        board[2] == playerOne &&
            board[4] == playerOne &&
            board[6] == playerOne) {
      setState(() {
        winner = "Player one";
        message = "$winner is the winner";
      });
    }
    // vertical win
    else if (board[0] == playerOne &&
            board[3] == playerOne &&
            board[6] == playerOne ||
        board[1] == playerOne &&
            board[4] == playerOne &&
            board[7] == playerOne ||
        board[2] == playerOne &&
            board[5] == playerOne &&
            board[8] == playerOne) {
      setState(() {
        winner = "Player One";
        message = "$winner is the winner";
      });
    }
  }

  void checkForPlayerTwoWin() {
    // horizontal win
    if (board[0] == playerTwo &&
            board[1] == playerTwo &&
            board[2] == playerTwo ||
        board[3] == playerTwo &&
            board[4] == playerTwo &&
            board[5] == playerTwo ||
        board[6] == playerTwo &&
            board[7] == playerTwo &&
            board[8] == playerTwo) {
      setState(() {
        winner = "Player Two";
        message = "$winner is the winner";
      });
    }
    //diagonl win
    else if (board[0] == playerTwo &&
            board[4] == playerTwo &&
            board[8] == playerTwo ||
        board[2] == playerTwo &&
            board[4] == playerTwo &&
            board[6] == playerTwo) {
      setState(() {
        winner = "Player Two";
        message = "$winner is the winner";
      });
    }
    // vertical win
    else if (board[0] == playerTwo &&
            board[3] == playerTwo &&
            board[6] == playerTwo ||
        board[1] == playerTwo &&
            board[4] == playerTwo &&
            board[7] == playerTwo ||
        board[2] == playerTwo &&
            board[5] == playerTwo &&
            board[8] == playerTwo) {
      setState(() {
        winner = "Player Two";
        message = "$winner is the winner";
      });
    }
  }

  void checkForDraw() {
    if (winner == "") {
      checkForPlayerOneWin();
      checkForPlayerTwoWin();
    } else if (board[0] == "O" ||
        board[0] == "X" && board[1] == "O" ||
        board[1] == "X" && board[2] == "O" ||
        board[2] == "X" && board[3] == "O" ||
        board[3] == "X" && board[4] == "O" ||
        board[4] == "X" && board[5] == "O" ||
        board[5] == "X" && board[6] == "O" ||
        board[6] == "X" && board[7] == "O" ||
        board[7] == "X" && board[8] == "O" ||
        board[8] == "X") {
      setState(() {
        message = "Game draw !";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.rectangle,
      ),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Text(
                "Player one is $playerOne",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Player two is $playerTwo",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                board[1],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        color: Colors.white,
                        margin: const EdgeInsets.all(3),
                        child: GestureDetector(
                          onTap: () {
                            play(0);
                          },
                          child: Center(
                            child: Text(board[0],
                                style: const TextStyle(
                                    fontSize: 70, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Container(
                        width: 110,
                        height: 110,
                        color: Colors.white,
                        margin: const EdgeInsets.all(3),
                        child: GestureDetector(
                          onTap: () {
                            play(1);
                          },
                          child: Center(
                            child: Text(board[1],
                                style: const TextStyle(
                                    fontSize: 70, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Container(
                        width: 110,
                        height: 110,
                        color: Colors.white,
                        margin: const EdgeInsets.all(3),
                        child: GestureDetector(
                          onTap: () {
                            play(2);
                          },
                          child: Center(
                            child: Text(board[2],
                                style: const TextStyle(
                                    fontSize: 70, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        color: Colors.white,
                        margin: const EdgeInsets.all(3),
                        child: GestureDetector(
                          onTap: () {
                            play(3);
                          },
                          child: Center(
                            child: Text(board[3],
                                style: const TextStyle(
                                    fontSize: 70, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Container(
                        width: 110,
                        height: 110,
                        color: Colors.white,
                        margin: const EdgeInsets.all(3),
                        child: GestureDetector(
                          onTap: () {
                            play(4);
                          },
                          child: Center(
                            child: Text(board[4],
                                style: const TextStyle(
                                    fontSize: 70, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Container(
                        width: 110,
                        height: 110,
                        color: Colors.white,
                        margin: const EdgeInsets.all(3),
                        child: GestureDetector(
                          onTap: () {
                            play(5);
                          },
                          child: Center(
                            child: Text(board[5],
                                style: const TextStyle(
                                    fontSize: 70, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        color: Colors.white,
                        margin: const EdgeInsets.all(3),
                        child: GestureDetector(
                          onTap: () {
                            play(6);
                          },
                          child: Center(
                            child: Text(board[6],
                                style: const TextStyle(
                                    fontSize: 70, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Container(
                        width: 110,
                        height: 110,
                        color: Colors.white,
                        margin: const EdgeInsets.all(3),
                        child: GestureDetector(
                          onTap: () {
                            play(7);
                          },
                          child: Center(
                            child: Text(board[7],
                                style: const TextStyle(
                                    fontSize: 70, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Container(
                        width: 110,
                        height: 110,
                        color: Colors.white,
                        margin: const EdgeInsets.all(3),
                        child: GestureDetector(
                          onTap: () {
                            play(8);
                          },
                          child: Center(
                            child: Text(board[8],
                                style: const TextStyle(
                                    fontSize: 70, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    message,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: newGame,
                    child: const Text("NEW GAME"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Home()));
                    },
                    child: const Text("EXIT"),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
