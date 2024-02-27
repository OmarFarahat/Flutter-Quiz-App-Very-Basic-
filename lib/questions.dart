import 'package:flutter/material.dart';
import 'package:quiz_application/start_screen.dart';
import 'package:quiz_application/answer_button.dart';
import 'package:quiz_application/data/questionsexample.dart';
import 'package:google_fonts/google_fonts.dart';

 
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer,});
    final void Function(String answer) onSelectAnswer;

  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void changeQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(context) {
    final currentquestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(60),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentquestion.text,
                style: GoogleFonts.teko(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ...currentquestion.getShuffledAnswers().map((answer) {
                return AnswerButton(
                   answer,()
                   {
                  changeQuestion(answer);
                   }
                );
              }),
            ]),
      ),
    );
  }
}
