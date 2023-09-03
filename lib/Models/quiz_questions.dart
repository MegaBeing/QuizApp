import 'package:flutter/cupertino.dart';

class QuizQuestion{
  QuizQuestion(this.question,this.answers);
  final String question;
  final List<String> answers;
  List<String> getShuffled(){
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}