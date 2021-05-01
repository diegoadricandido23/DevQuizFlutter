import 'dart:convert';

import 'package:DevQuiz/shared/models/question_model.dart';

enum Level { facil, medio, difil, perito }

extension LevelStringExt on String {
 Level get parse => {
    "facil" : Level.facil,
    "medio" : Level.medio,
    "difil" : Level.difil,
    "perito" : Level.perito
  }[this]!;
}

extension LevelExt on Level {
 String get parse => {
    Level.facil : "facil",
    Level.medio : "medio" ,
    Level.difil : "difil",
    Level.perito : "perito"
  }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;
  final String image;
  final Level level;

  QuizModel(
      {
        required this.title,
        required this.questions,
        this.questionAnswered = 0,
        required this.image,
        required this.level
      });

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    final quiz =  new QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionAnswered: map['questionAnswered'],
      image: map['image'],
      level: map['level'].toString().parse,
    );
    return quiz;
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'title': this.title,
      'questions': this.questions.map((e) => e.toMap()).toList(),
      'questionAnswered': this.questionAnswered,
      'image': this.image,
      'level': this.level.parse,
    };
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}