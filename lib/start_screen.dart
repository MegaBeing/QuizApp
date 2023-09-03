import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/quiz.dart';

class Startscreen extends StatelessWidget {
  const Startscreen(this.startQuiz,{super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color(0x2ffbfafa),
          ),
          // Opacity(
          //     opacity: 0.3,
          //     child: Image.asset('assets/images/quiz-logo.png', width: 300)),
          const SizedBox(height: 80),
          Text(
            'learn Flutter the fun way!',
            style: GoogleFonts.lato(fontSize: 24, color: const Color(0xffffffff)),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed:(){startQuiz();},
            label: const Text("Start Quiz"),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color(0xff150364),
            ),
            icon: const Icon(Icons.arrow_right),
          )
        ],
      ),
    );
  }
}
