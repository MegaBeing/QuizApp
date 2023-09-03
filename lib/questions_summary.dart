import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  QuestionSummary({super.key, required this.summaryData});
  List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: summaryData.map((data) {
            return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 12,
                      child: Text(
                        "${(data['question_index'] as int) + 1}",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                      )),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          data['question'].toString(),
                          style: TextStyle(
                            color: Color(0xFFF49606),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['correct_answer'].toString(),
                            style: TextStyle(color: Color(0xff32f701))),
                        Text(data['user_answer'].toString(),
                            style: TextStyle(color: Color(0xff01aaf9))),
                      ],
                    ),
                  )
                ]);
          }).toList(),
        ),
      ),
    );
  }
}
