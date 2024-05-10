import 'package:flutter/material.dart';
import 'package:flutter_application_minigame/pages/my_button.dart';

class WrongGuessPage extends StatelessWidget {
  const WrongGuessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 157, 163),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Guess Game',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Sorry! Wrong guess. Please try again....",
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          MyButton(
            text: "Try Again",
            color: Colors.blueAccent,
            onpressed: () => Navigator.of(context).pop(),
            textStyle: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
