import 'package:firstly/Game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedCharacter = " ";

  void setCharacterX() {
    setState(() {
      selectedCharacter = "X";
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Game(character: selectedCharacter),
        ),
      );
    });
  }

  void setCharacterO() {
    setState(() {
      selectedCharacter = "O";
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Game(character: selectedCharacter),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          widthFactor: double.infinity,
          child: Text(
            "TIC-TAC-TOE",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Center(
        widthFactor: double.infinity,
        heightFactor: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "SELECT CHARACTER",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "X's or O's",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setCharacterX();
                  },
                  child: const Text(
                    "X",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  style: const ButtonStyle(),
                  onPressed: () {
                    setCharacterO();
                  },
                  child: const Text(
                    "O",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
