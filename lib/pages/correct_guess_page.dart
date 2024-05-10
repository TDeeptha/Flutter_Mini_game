import 'package:flutter/material.dart';
import 'package:flutter_application_minigame/pages/home_page.dart';
import 'package:flutter_application_minigame/pages/my_button.dart';

class CorrectGuessPage extends StatelessWidget {
  final int secretNumber;
  const CorrectGuessPage({
    super.key,
    required this.secretNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        //remove back button
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Guess Game',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Yes! you guessed it right.My secret number is",
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            secretNumber.toString(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          MyButton(
            // button
            text: "Start the Game Again",
            color: Colors.blueAccent,
            onpressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            ),
            textStyle:
                const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ],
      ),
    );
  }
}
