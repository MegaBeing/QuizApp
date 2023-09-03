import 'package:flutter/material.dart';
import 'package:quiz_app/Data/Questions.dart';
import 'package:quiz_app/questions_summary.dart';
// My Implementation
// class Result extends StatelessWidget {
//   Result({super.key, required this.selectedAnswers});
//   final List<String> selectedAnswers;
//   int correct = 0;
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     List<Widget> finale = [];
//     Widget a;
//     for (var i = 0; i < selectedAnswers.length; i++) {
//       if (selectedAnswers[i] == questions[i].answers[0]) {
//         a = SizedBox(
//             height: 70,
//             child: Column(
//               children: [
//                 Text(questions[i].question),
//                 Text(
//                   selectedAnswers[i],
//                   style: TextStyle(
//                     color: Colors.greenAccent,
//                   ),
//                 ),
//                 Text(questions[i].answers[0],
//                     style: TextStyle(
//                       color: Colors.blueAccent,
//                     )),
//               ],
//             ));
//         correct++;
//       } else {
//         a = SizedBox(
//             height: 50,
//             child: Column(
//               children: [
//                 Text(questions[i].question),
//                 Text(
//                   selectedAnswers[i],
//                   style: TextStyle(color: Colors.redAccent),
//                 ),
//                 Text(questions[i].answers[0],
//                     style: TextStyle(color: Colors.blueAccent)),
//               ],
//             ));
//       }
//       finale.add(a);
//     }
//     return Center(
//         child: Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(
//             "You answered $correct out of ${questions.length} questions correctly"),
//         ListView(
//           scrollDirection: Axis.vertical,
//           shrinkWrap: true,
//           // padding: EdgeInsets.all(10),
//           children: finale,
//         )
//       ],
//     ));
//   }
// }

// ------------------------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------------------------

// Sir's Implementation

class Result extends StatelessWidget {
  Result({super.key, required this.selectedAnswers});
  final List<String> selectedAnswers;
  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final total = questions.length;
    final correct = getSummaryData().where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $correct out of $total questions correctly",
              style: TextStyle(color:Color(0xffe0ff22)),
            ),
            const SizedBox(height: 30),
            QuestionSummary(summaryData: getSummaryData()),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {},
              child: const Text("Restart Quiz"),
            )
          ],
        ),
      ),
    );
  }
}
