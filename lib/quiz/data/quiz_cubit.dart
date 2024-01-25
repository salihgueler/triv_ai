import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:triv_ai/models/Question.dart';
import 'package:http/http.dart' as http;

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  final _answers = <String>[];

  Future<void> generateQuestions(
    int questionCount,
    List<String> categories,
    String difficulty,
  ) async {
    emit(QuizQuestionsLoading());
    final url = Uri.https(
      'q9000l7dqc.execute-api.eu-central-1.amazonaws.com',
      'prod/generateQuiz',
      {
        "questionCount": questionCount.toString(),
        "categoryList": categories.join(","),
        "difficulty": difficulty,
      },
    );
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*'
      },
    );
    final content = json.decode(response.body);
    final outputText = content["message"]["results"][0]["outputText"] as String;
    final firstIndex = outputText.indexOf("{");
    final lastIndex = outputText.lastIndexOf("}");
    final chopped = outputText.substring(firstIndex, lastIndex + 1);
    final jsonToParse = json.decode(chopped)["rows"] as List<dynamic>;
    final questions = <Question>[];
    for (final parsedElement in jsonToParse) {
      final optionsDynamic = parsedElement['Options'] as List<dynamic>;
      final options = optionsDynamic.cast<String>();
      questions.add(
        Question(
          title: parsedElement['Question'] as String,
          answer: parsedElement['CorrectAnswer'] as String,
          category: parsedElement['Category'] as String,
          difficulty: difficulty,
          options: options,
          createdAt: TemporalDateTime(DateTime.now()),
          updatedAt: TemporalDateTime(DateTime.now()),
        ),
      );
    }
    emit(QuizSuccess(questions, questions.first, 0));
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
}
