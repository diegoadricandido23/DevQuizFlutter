import 'dart:convert';

import 'awnser_model.dart';

class QuestionModel {
  final String title;
  final List<AnswerModel> answer;

  QuestionModel({
    required this.title,
    required this.answer
  }) : assert(answer.length == 4);

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      answer: List<AnswerModel>.from(map['answers']?.map(
              (x) => AnswerModel.fromMap(x)),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'title': this.title,
      'answer': this.answer,
    } as Map<String, dynamic>;
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));
}