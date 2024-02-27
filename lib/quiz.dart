import 'package:flutter/material.dart';
import 'package:quiz_application/questions.dart';
import 'package:quiz_application/start_screen.dart';
import 'package:quiz_application/data/questionsexample.dart';
import 'package:quiz_application/models/results_screen.dart';


class Quiz extends StatefulWidget{
  const Quiz({super.key});
  State<Quiz> createState(){
    return _QuizState();
  }

}

class _QuizState extends State<Quiz>{
   List<String> selectedAnswers=[];
  var activeScreen= "startscreen";

  void  setScreen() {
    setState( () {
    activeScreen =  "quizscreen";
  });
  }

void chooseAnswer(String answer){
  selectedAnswers.add(answer);
  if(selectedAnswers.length==questions.length){

    setState(() {
      activeScreen="result-screen";
    });
  }
}

void restartPage(){


    setState(() {
     selectedAnswers=[];

      activeScreen="startscreen";
    });}

@override
Widget build(context){
  Widget screenState = startScreen(setScreen);
  if(activeScreen == "quizscreen"){
    screenState=QuestionsScreen(onSelectAnswer: chooseAnswer,);
  } else if(activeScreen=="result-screen"){
    screenState=ResultScreen(chosenAnswers: selectedAnswers,restart: restartPage,);

  }// else if(activeScreen=="startscreen"){
  //    Widget screenState = startScreen(setScreen);

 // }
  
return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient:
                  LinearGradient(colors: [ Color.fromARGB(255, 40, 73, 2), Colors.black], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  
            ),
            child: screenState 
              ),
      ),
    );

}

  }
