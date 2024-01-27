import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:triv_ai/models/ModelProvider.dart';
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
    emit(QuizLoading());
    final url = Uri.https(
      'ow3cp84bqb.execute-api.eu-central-1.amazonaws.com',
      'prod/generateQuiz',
      {
        "questionCount": questionCount.toString(),
        "categoryList": categories.join(","),
        "difficulty": difficulty,
      },
    );
    try {
      final response = await http.get(
        url,
        headers: {
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      final content = json.decode(response.body);
      final outputText = content["message"]["completion"] as String;
      final firstIndex = outputText.indexOf("[");
      final lastIndex = outputText.lastIndexOf("]");
      final chopped = outputText.substring(firstIndex, lastIndex + 1);
      final jsonToParse = json.decode(chopped) as List<dynamic>;
      final questions = <Question>[];
      for (final parsedElement in jsonToParse) {
        final optionsDynamic = parsedElement['options'] as List<dynamic>;
        final options = optionsDynamic.cast<String>();
        questions.add(
          Question(
            title: parsedElement['question'] as String,
            answer: parsedElement['correctAnswer'] as String,
            category: parsedElement['category'] as String,
            difficulty: difficulty,
            options: options,
            createdAt: TemporalDateTime(DateTime.now()),
            updatedAt: TemporalDateTime(DateTime.now()),
          ),
        );
        emit(QuizSuccess(questions, questions.first, 0));
      }
    } on Exception catch (e) {
      emit(QuizError('Could not fetch the questions: \n\n$e'));
    }
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
    if (state is QuizFinishedState) {
      final currentState = (state as QuizFinishedState);
      final questions = currentState.questions;
      final answers = currentState.answers;
      final score = currentState.score;
      int correctAnswerCount = 0;
      for (var i = 0; i < questions.length; i++) {
        if (questions[i].answer == answers[i]) {
          correctAnswerCount++;
        }
      }
      emit(QuizLoading());
      final result = Result(
        score: score,
        correctAnswerCount: correctAnswerCount,
        answers: answers,
      );
      final mutation = ModelMutations.create(result);
      try {
        final response = await Amplify.API.mutate(request: mutation).response;
        for (final question in currentState.questions) {
          final questionMutation = ModelMutations.create(
            question.copyWith(
              resultQuestionsId: result.id,
            ),
          );
          final questionResult =
              await Amplify.API.mutate(request: questionMutation).response;
          if (questionResult.hasErrors) {
            throw Exception(questionResult.errors.toString());
          }
        }
        if (response.hasErrors) {
          emit(QuizError(response.errors.toString()));
        } else {
          emit(QuizSaved());
        }
      } on Exception catch (e) {
        emit(QuizError(e.toString()));
      }
    }
  }
}
