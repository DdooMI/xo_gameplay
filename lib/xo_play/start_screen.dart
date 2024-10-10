import 'package:flutter/material.dart';
import 'package:xo_gameplay/xo_play/home_screen.dart';
import 'package:xo_gameplay/xo_play/widgets/text_form_field_widget.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final formKey = GlobalKey<FormState>();
  final player1Controller = TextEditingController();
  final player2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
              key: formKey,
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.1),
                    child: Image.asset("assets/xo.png"),
                  ),
                  Column(
                    children: [
                      TextFormFieldWidget(
                          color: const Color(0xff009688),
                          hint: "Player 1",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'player 1 can\'t be empty';
                            }
                            return null;
                          },
                          controller: player1Controller),
                      TextFormFieldWidget(
                          color: const Color(0xffFFc107),
                          hint: "Player 2",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'player 2 can\'t be empty';
                            }
                            return null;
                          },
                          controller: player2Controller),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.05),
                          child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.of(context).pushNamed(
                                      HomeScreen.routeName,
                                      arguments: Players(
                                          player1: player1Controller.text,
                                          player2: player2Controller.text));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffFFc107)),
                              child: const Text(
                                "Start",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff607d8b)),
                              )),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class Players {
  String player1;
  String player2;

  Players({required this.player1, required this.player2});
}
