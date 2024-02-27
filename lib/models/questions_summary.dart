import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary({required this.summaryData, Key? key}) : super(key: key);

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: GoogleFonts.abel(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.right,
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.teko(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['user_answer'] as String,
                        style: GoogleFonts.signika(
                          color: const Color.fromARGB(127, 255, 255, 255),
                          fontSize: 23,
                        ),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: GoogleFonts.teko(
                          color: Color.fromARGB(255, 4, 255, 134),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
