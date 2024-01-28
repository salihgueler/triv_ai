import 'package:equatable/equatable.dart';
import 'package:triv_ai/question/data/question.dart';

class Result extends Equatable {
  const Result({
    required this.score,
    required this.correctAnswerCount,
    required this.questions,
    required this.answers,
  });

  final double score;
  final int correctAnswerCount;
  final List<Question>? questions;
  final List<String> answers;

  @override
  List<Object?> get props => [
        score,
        correctAnswerCount,
        questions,
        answers,
      ];
}
