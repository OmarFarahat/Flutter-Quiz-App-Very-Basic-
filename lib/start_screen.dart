import 'package:flutter/material.dart';
import 'package:quiz_application/quiz.dart';
import 'package:google_fonts/google_fonts.dart';


class startScreen extends StatelessWidget {
  const startScreen( this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          'football.png',
          width: 200,
        //   color: Color.fromARGB(77, 255, 255, 255),
        ),
        const SizedBox(height: 80),
         Text(
          "Test Your Football Knowledge!",
          style: GoogleFonts.alice(
            color:Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 32
        
          ),
        ),
        const SizedBox(height: 80), 
        OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white
            ),
            icon: Icon(Icons.arrow_right_alt),
            label: const Text(
              "Start Quiz",
            ))
      ]),
    );
  }
}
