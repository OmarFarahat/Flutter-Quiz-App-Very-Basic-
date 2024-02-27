import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_application/data/questionsexample.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_application/data/questionsexample.dart';
import 'package:quiz_application/models/questions_summary.dart';


class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.chosenAnswers,required this.restart});
  List<String> chosenAnswers;
  Function() restart;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String,Object>> summary = [];
    for(int i =0;i<chosenAnswers.length;i++){
      summary.add({
        'question_index':i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;

  }

  @override
  Widget build(BuildContext context) {
    final getdata=getSummaryData();
    final numTotalQuestions=questions.length;
    final numCorrectQuestions=getdata.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You Answered $numCorrectQuestions out of $numTotalQuestions correctly!", 
            style: GoogleFonts.teko(
              color:Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24

            ),
            ),
            const SizedBox(height: 30,),
            QuestionsSummary(summaryData: getdata),
            TextButton(onPressed: (){
              restart(); 
            }, child:Text("Restart", style: GoogleFonts.taiHeritagePro(color:Colors.white),) )
          ],
        ),
      ),
    );
  }
}
