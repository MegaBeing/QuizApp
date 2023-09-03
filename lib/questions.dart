import 'package:flutter/material.dart';
import 'package:quiz_app/Options.dart';
// import 'package:quiz_app/Models/quiz_questions.dart';
import 'package:quiz_app/Data/Questions.dart';
import 'package:google_fonts/google_fonts.dart';
class Questions extends StatefulWidget {
  const  Questions({super.key,required this.onSelectedAnswer });
  final void Function(String answer) onSelectedAnswer;
  @override
  State<Questions> createState() {
    return _Questions();
  }
}

class _Questions extends State<Questions> {
  int index = 0;
  int length = questions.length;
  void nextQuestion(String answer){
    widget.onSelectedAnswer(answer);
    setState(() {
        index++;
    });
  }
  @override
  Widget build(context) {
    var mcq = questions[index];
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              mcq.question,
              style: GoogleFonts.lato(
                color:Color(0xff967ae9),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...mcq.getShuffled().map((answer) {
              return Options(answer,() {
                nextQuestion(answer);
              });
            })
          ],
        ),
      ),
    );
  }
}
