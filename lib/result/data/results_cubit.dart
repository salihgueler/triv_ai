import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:triv_ai/result/data/result.dart';

part 'results_state.dart';

class ResultsCubit extends Cubit<ResultsState> {
  ResultsCubit() : super(ResultsInitial());

  Future<void> getResults() async {
    emit(const ResultsSuccess([]));
  }
}
