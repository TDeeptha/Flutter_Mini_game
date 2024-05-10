import 'package:flutter/material.dart';
import 'package:flutter_application_minigame/pages/home_page.dart';
import 'package:flutter_application_minigame/pages/my_button.dart';

class GameOverPage extends StatelessWidget {
  final secretNumber;
  const GameOverPage({super.key, this.secretNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 186, 208, 255),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        //remove back button
        automaticallyImplyLeading: false,
        title: const Align(
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
              "Sorry Game Over. My secrect number is",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            secretNumber.toString(),
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          MyButton(
            text: "Start the Game Again ",
            onpressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HomePage(),
              ));
            },
            color: Colors.blueAccent,
            textStyle: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
