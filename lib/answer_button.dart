import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';


class AnswerButton extends StatelessWidget {
  AnswerButton(this.answerprovided, this.choosen, {super.key});
  final String answerprovided;
  final void Function() choosen;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
      border: Border.all( color:const Color.fromARGB(0, 255, 255, 255), width:10)),
      child: ElevatedButton(
          onPressed: choosen,
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),  
              padding: const EdgeInsets.all(20) 
              
      
      
              ),
          child: Text(answerprovided,textAlign: TextAlign.center, style: GoogleFonts.dmSerifDisplay(),),),
    );
  }
}
