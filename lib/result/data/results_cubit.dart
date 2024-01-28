import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:triv_ai/models/Question.dart';
import 'package:triv_ai/models/Result.dart';

part 'results_state.dart';

class ResultsCubit extends Cubit<ResultsState> {
  ResultsCubit() : super(ResultsInitial());

  Future<void> getResults() async {
    emit(ResultsLoading());
    try {
      const graphQLDocument = '''
query ListResults {
  listResults {
    items {
      id
      answers
      correctAnswerCount
      score
      questions {
        items {
          id
          answer
          category
          difficulty
          options
          title
          updatedAt
        }
      }
    }
  }
}
    ''';
      final getResultRequest = GraphQLRequest<String>(
        document: graphQLDocument,
      );
      final response =
          await Amplify.API.query(request: getResultRequest).response;

      if (response.hasErrors || response.data == null) {
        emit(ResultsError(response.errors.toString()));
      } else {
        final rawResults = response.data;
        final parsedResults = json.decode(rawResults!) as Map<String, dynamic>;
        final results = (parsedResults['listResults']['items'] as List<dynamic>)
            .cast<Map<String, dynamic>>()
            .map(
              (e) => Result(
                id: e['id'] as String,
                answers: (e['answers'] as List<dynamic>).cast<String>(),
                correctAnswerCount: e['correctAnswerCount'] as int,
                score: e['score'] as double,
                questions: (e['questions']['items'] as List<dynamic>)
                    .cast<Map<String, dynamic>>()
                    .map(
                      (e) => Question(
                        id: e['id'] as String,
                        answer: e['answer'] as String,
                        category: e['category'] as String,
                        difficulty: e['difficulty'] as String,
                        options: (e['options'] as List<dynamic>).cast<String>(),
                        title: e['title'] as String,
                        updatedAt: TemporalDateTime.fromString(
                            e['updatedAt'] as String),
                      ),
                    )
                    .toList(growable: false)
                  ..sort(
                    (a, b) => a.updatedAt!
                        .getDateTimeInUtc()
                        .compareTo(b.updatedAt!.getDateTimeInUtc()),
                  ),
              ),
            )
            .toList(growable: false);
        emit(ResultsSuccess(results));
      }
    } on Exception catch (e) {
      emit(ResultsError(e.toString()));
    }
  }
}
