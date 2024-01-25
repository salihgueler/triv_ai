import 'package:equatable/equatable.dart';

class Question extends Equatable {
  const Question({
    required this.title,
    required this.answer,
    required this.category,
    required this.difficulty,
    required this.options,
    required this.createdAt,
    required this.updatedAt,
  });

  final String title;
  final String answer;
  final String category;
  final String difficulty;
  final List<String> options;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        title,
        answer,
        category,
        difficulty,
        options,
        createdAt,
        updatedAt,
      ];
}
