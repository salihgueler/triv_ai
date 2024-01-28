import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:triv_ai/question/data/question.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  final _answers = <String>[];
  static const _questions = <Question>[
    Question(
      title: 'What is the capital of France?',
      answer: 'Paris',
      category: 'Geography',
      difficulty: 'Easy',
      options: ['Paris', 'Berlin', 'London', 'New York'],
    ),
    Question(
      title: 'Who wrote the Harry Potter series?',
      answer: 'J.K. Rowling',
      category: 'Literature',
      difficulty: 'Easy',
      options: ['J.K. Rowling', 'J.R.R. Tolkien', 'J.D. Salinger', 'J.K. Simmons'],
    ),
    Question(
      title: 'What is the ocean between Europe and America called?',
      answer: 'Atlantic',
      category: 'Geography',
      difficulty: 'Easy',
      options: ['Atlantic', 'Pacific', 'Indian', 'Arctic'],
    )
  ];
  Future<void> generateQuestions(
    int questionCount,
    List<String> categories,
    String difficulty,
  ) async {
    emit(QuizLoading());
    Future.delayed(const Duration(seconds: 1));
    emit(QuizSuccess(_questions, _questions.first, 0));
  }

  void fetchQuestions() {
    if (state is QuizSuccess) {
      emit(
        QuizSuccess(
          (state as QuizSuccess).questions,
          (state as QuizSuccess).currentQuestion,
          (state as QuizSuccess).currentQuestionIndex,
        ),
      );
    } else {
      emit(const QuizError('Quiz not found'));
    }
  }

  Future<void> changeQuestion(String selectedOption) async {
    _answers.add(selectedOption);
    if (state is QuizSuccess) {
      final questions = (state as QuizSuccess).questions;
      final currentQuestionIndex = (state as QuizSuccess).currentQuestionIndex;
      if (currentQuestionIndex < questions.length - 1) {
        emit(
          QuizSuccess(
            questions,
            questions[currentQuestionIndex + 1],
            currentQuestionIndex + 1,
          ),
        );
      } else {
        final score = _calculateScore(questions, _answers);
        emit(
          QuizFinishedState(
            questions,
            _answers,
            score,
          ),
        );
      }
    } else {
      emit(const QuizError('Quiz not found'));
    }
  }

  double _calculateScore(List<Question> questions, List<String> answers) {
    final scorePerQuestion = 100 / questions.length;
    var score = 0.0;
    for (var i = 0; i < questions.length; i++) {
      if (questions[i].answer == answers[i]) {
        score += scorePerQuestion;
      }
    }
    return score;
  }

  void resetQuiz() {
    emit(QuizInitial());
    _answers.clear();
  }

  Future<void> saveQuiz() async {
    resetQuiz();
    emit(QuizSaved());
  }
}
