import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_minigame/pages/correct_guess_page.dart';
import 'package:flutter_application_minigame/pages/game_over_page.dart';
import 'package:flutter_application_minigame/pages/my_button.dart';
import 'package:flutter_application_minigame/pages/wrong_guess_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  Random random = Random();
  int? userGuess;
  int attempt = 0;
  int? secretNumber;

  // create a random number
  @override
  void initState() {
    super.initState();
    secretNumber = random.nextInt(10) + 1;
  }

  void checkGuess() {
    if (userGuess == null || userGuess == 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(" Please enter number..."),
            actions: <Widget>[
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    "OK",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          );
        },
      );
      return;
    }
    // user guess equals to secret number , navigate to correct guess page
    if (userGuess == secretNumber) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CorrectGuessPage(
            secretNumber: secretNumber!,
          ),
        ),
      );
    } else {
      // increment of user attempt
      setState(() {
        attempt++;
      });
      if (attempt < 3) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const WrongGuessPage(),
          ),
        );
        controller.text = '';
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => GameOverPage(
              secretNumber: secretNumber!,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Guess Game',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/minigameimg.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                'I have a secret number in my mind(1-10). You have 3 chances to guess it. Can you guess it?',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              child: Text('$attempt  Of 3 Chances are taken'),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Guess Number 1-10',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => setState(() {
                  userGuess = int.tryParse(value);
                }),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('$attempt/3'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
              text: "Submit",
              color: Colors.blue,
              onpressed: checkGuess,
              textStyle: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
