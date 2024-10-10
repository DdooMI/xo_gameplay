import 'package:flutter/material.dart';
import 'package:xo_gameplay/xo_play/start_screen.dart';
import 'package:xo_gameplay/xo_play/widgets/xo_button_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> labels = List.filled(9, '');
  int round = 1;
  int score1 = 0;
  int score2 = 0;
  @override
  Widget build(BuildContext context) {
    Players players = ModalRoute.of(context)!.settings.arguments as Players;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.08),
                child: Column(
                  children: [
                    Text(
                      players.player1,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: round % 2 == 0
                              ? const Color(0xff009688)
                              : const Color(0xffFFc107)),
                    ),
                    Text(
                      "score: $score1",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: round % 2 == 0
                              ? const Color(0xff009688)
                              : const Color(0xffFFc107)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.08),
                child: Column(
                  children: [
                    Text(
                      players.player2,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: round % 2 == 0
                              ? const Color(0xffFFc107)
                              : const Color(0xff009688)),
                    ),
                    Text("score: $score2",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: round % 2 == 0
                                ? const Color(0xffFFc107)
                                : const Color(0xff009688)))
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: (MediaQuery.of(context).size.height * 0.29),
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  return XoButtonWidget(
                    color: labels[index] == "X"
                        ? const Color(0xff009688)
                        : const Color(0xffFFc107),
                    label: labels[index],
                    onPressed: () => onBorderButtonClicked(index),
                  );
                },
                itemCount: 9,
              ),
            ),
          )
        ],
      )),
    );
  }

  onBorderButtonClicked(int index) {
    setState(() {
      if (labels[index].isNotEmpty) {
        return;
      }
      if (round % 2 == 0) {
        labels[index] = 'O';
        if (checkWinner('O')) {
          score2 += 10;
          clearBoard();
        }
      } else {
        labels[index] = 'X';
        if (checkWinner('X')) {
          score1 += 10;
          clearBoard();
          setState(() {});
          return;
        }
      }
      round++;
      if (round == 10) {
        clearBoard();
      }
    });
  }

  bool checkWinner(String label) {
    if (round < 5) return false;
    if ((labels[0] == label && labels[4] == label && labels[8] == label) ||
        (labels[2] == label && labels[4] == label && labels[6] == label)) {
      return true;
    }
    if ((labels[0] == label && labels[1] == label && labels[2] == label) ||
        (labels[3] == label && labels[4] == label && labels[5] == label) ||
        (labels[6] == label && labels[7] == label && labels[8] == label)) {
      return true;
    }
    if ((labels[0] == label && labels[3] == label && labels[6] == label) ||
        (labels[1] == label && labels[4] == label && labels[7] == label) ||
        (labels[2] == label && labels[5] == label && labels[8] == label)) {
      return true;
    }
    return false;
  }

  clearBoard() {
    labels = List.filled(9, '');
    round = 1;
  }
}
