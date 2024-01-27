part of 'quiz_cubit.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizSaved extends QuizState {}

class QuizError extends QuizState {
  const QuizError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class QuizSuccess extends QuizState {
  const QuizSuccess(
    this.questions,
    this.currentQuestion,
    this.currentQuestionIndex,
  );

  final List<Question> questions;
  final Question currentQuestion;
  final int currentQuestionIndex;

  @override
  List<Object> get props => [
        questions,
        currentQuestion,
        currentQuestionIndex,
      ];
}

class QuizFinishedState extends QuizState {
  const QuizFinishedState(
    this.questions,
    this.answers,
    this.score,
  );

  final List<Question> questions;
  final List<String> answers;
  final double score;

  @override
  List<Object> get props => [questions, answers];
}
