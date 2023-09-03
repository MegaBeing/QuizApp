import 'package:flutter/material.dart';
import 'package:quiz_app/Data/Questions.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/results.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override
  State<Quiz> createState(){
    return _Quiz();
  }
}

class _Quiz extends State<Quiz>{
  final List<String>SelectedAnswers = [];
  Widget? stateVar;
  void chooseAnswers(String answer){
    SelectedAnswers.add(answer);
    if(SelectedAnswers.length == questions.length){
      setState(() {
        stateVar = Result(selectedAnswers: SelectedAnswers);
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stateVar = Startscreen(changeState);
  }
  void changeState(){
    setState(() {
      stateVar = Questions(onSelectedAnswer: chooseAnswers,);
    });
  }
  @override
  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff694fe2),
                Color(0xff2c0151),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: stateVar,
        ),
      ),
    );
  }
}