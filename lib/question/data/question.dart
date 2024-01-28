import 'package:equatable/equatable.dart';

class Question extends Equatable {
  const Question({
    required this.title,
    required this.answer,
    required this.category,
    required this.difficulty,
    required this.options,
  });

  final String title;
  final String answer;
  final String category;
  final String difficulty;
  final List<String> options;

  @override
  List<Object?> get props => [title, answer, category, difficulty, options];
}
